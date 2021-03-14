import useMediaQuery from "@material-ui/core/useMediaQuery";
import React from "react";
import {getSong, getSongDetails} from "./functions/songs";
import addMediaSession from "./functions/Helper/addMediaSession";
import {Cast} from "./functions/Cast/NewNewCast";
import endPoints from "./api/endpoints/endpoints";
import {useSnackbar} from "notistack";
import {get, set} from "idb-keyval";
import {storageIndex, storageIndex as StorageIndex} from "./functions/Helper/storageIndex";
import {createMuiTheme, MuiThemeProvider} from "@material-ui/core/styles";
// import * as Comlink from "comlink";

// const comlinkWorker = Comlink.wrap(new Worker("./comlink-worker.js"));
export const isTvContext = React.createContext(false);
export const IsTvProvider = ({children}) => {
    const isTv = useMediaQuery("(min-width:600px)");
    console.log("isTv", isTv);
    return <isTvContext.Provider value={isTv}>{children}</isTvContext.Provider>;
};

export const LoadingContext = React.createContext(false);
export const LoadingProvider = React.memo(({children}) => {
    const [loading, setLoading] = React.useState(false);
    return <LoadingContext.Provider value={[loading, setLoading]}>{children}</LoadingContext.Provider>;
});


export const DrawerContext = React.createContext(false);
export const DrawerProvider = React.memo(({children}) => {
    const [drawer, setDrawer] = React.useState(false);
    return <DrawerContext.Provider value={[drawer, setDrawer]}>{children}</DrawerContext.Provider>;
});

export const PlayContext = React.createContext({
    audioElement: window.audio,
    videoElement: null,
    playList: null,
    // componentState: {
    //     Dialog: false,
    //     MiniPlayer: false
    // },
    others: null,
    autoPlay: false
});
export const PlayerContext = React.createContext({
    Dialog: false,
    MiniPlayer: false
});
export const PlayerProvider = React.memo(({children}) => {
    const [a, b] = React.useState({
        Dialog: false,
        MiniPlayer: false
    });
    return <PlayerContext.Provider value={[a, b]}>{children}</PlayerContext.Provider>
});
export const PlayProvider = React.memo(({children}) => {
    const {enqueueSnackbar} = useSnackbar();
    const [, setPlayerState] = React.useContext(PlayerContext);
    const [playState, setPlayState] = React.useState({
        audioElement: window.audio,
        videoElement: null,
        playList: null,
        // componentState: {
        //     Dialog: false,
        //     MiniPlayer: false
        // },
        others: null,
        autoPlay: false
    });
    const SkipSong = async (data, index) => {
        if (!data) return;
        if (data.isOffline) {
            // data.videoElement.snippet.thumbnails.high.url = URL.createObjectURL(data.blobs.thumbnail);
            await PlaySong({
                useProxy: false,
                songURI: URL.createObjectURL(data.blobs.audio),
                song: data.videoElement,
                playList: {
                    ...playState.playList,
                    index: index
                }
            });
            addMediaSession({
                artist: data.videoElement.snippet.channelTitle,
                title: data.videoElement.snippet.title,
                artwork: [{
                    src: data.videoElement.snippet.thumbnails.high.url,
                    sizes: "96x96",
                    type: "image/png"
                }]
            }, {
                playAudio: () => playState.audioElement.play(),
                pauseAudio: () => playState.audioElement.pause()
            }, playState.audioElement);
        } else {
            await PlaySong({
                useProxy: true,
                song: data,
                playList: {
                    ...playState.playList,
                    index: index
                }
            });
            addMediaSession({
                artist: data.snippet.channelTitle,
                title: data.snippet.title,
                artwork: [{
                    src: data.snippet.thumbnails.high.url,
                    sizes: "96x96",
                    type: "image/png"
                }]
            }, {
                playAudio: () => playState.audioElement.play(),
                pauseAudio: () => playState.audioElement.pause()
            }, playState.audioElement);
        }
    };
    const tv = React.useContext(isTvContext);
    const setLoading = React.useContext(LoadingContext)[1];
    const AutoPlay = (autoplay) => {
        console.log("AutoPlay: ", autoplay);
        if (autoplay) playState.audioElement.onended = async () => {
            if (playState.playList.list.items[playState.playList.index + 1]) {
                const item = playState.playList.list.items[playState.playList.index + 1];
                await SkipSong(item, playState.playList.index + 1);
            }
        };
        else playState.audioElement.onended = null;
    };
    /*    React.useEffect(() => {
            if (localStorage.getItem("3d-sound") !== null) {
                const panner = new StereoPannerNode(window.kmusic.audioContext, {pan: 0});
                window.kmusic.track.connect(panner).connect(window.kmusic.audioContext.destination);
                // let direction = 10;
                // let i = 0;
                const s = a => panner.pan.value = a;
                window.kmusic.loopInterval = comlinkWorker.intervals.makeAudioPanning(Comlink.proxy(s));
                window.kmusic.clearLoop = async () => comlinkWorker.intervals.clearLoopInterval();
            }
        }, []);

     */
    React.useEffect(() => {
        const a = async () => {
            const id = new URLSearchParams(window.location.search).get("play");
            if (!id) return;
            const songDetails = await getSongDetails(id);
            if (!songDetails) return;
            await PlaySong({
                useProxy: true,
                song: songDetails,
            });
        };
        a();
    }, []);
    const PlaySong = async (options) => {
        setLoading(true);
        const {song, playList, componentState, useProxy, others} = options;
        try {
            await playState.audioElement.pause();
            if (useProxy) {
                const songURI = await getSong(song.id);
                playState.audioElement.src = endPoints.proxyURI(songURI);
            } else playState.audioElement.src = options["songURI"];

            setPlayState({
                ...playState,
                videoElement: song,
                // componentState: componentState || {
                //     ...playState.componentState,
                //     Dialog: !tv,
                //     MiniPlayer: tv
                // },
                playList: playList,
                others: others
            });
            setPlayerState(componentState || ({
                Dialog: !tv,
                MiniPlayer: tv
            }));
            // console.log("PlayState:", {
            //     ...playState,
            //     videoElement: song,
            //     componentState: componentState || {
            //         ...playState.componentState,
            //         Dialog: !tv,
            //         MiniPlayer: tv
            //     },
            //     playList: playList,
            //     others: others
            // }, " - Contexts");
            await playState.audioElement.play();
            setLoading(false);
        } catch (e) {
            setLoading(false);
            enqueueSnackbar("Cannot Play Song");
            return new Error("Failed to Play Song");
        }
    };

    // React.useEffect(() => {}, [])
    return <PlayContext.Provider
        value={{playState, setPlayState, SkipSong, AutoPlay, PlaySong}}>{children}</PlayContext.Provider>;
});

export const SearchContext = React.createContext(null);
export const SearchingProvider = React.memo(({children}) => {
    const [query, setQuery] = React.useState(null);
    return <SearchContext.Provider value={[query, setQuery]}>{children}</SearchContext.Provider>;
});


// export const CastProvider = React.memo(({children}) => {
// 	const _Cast = Cast();
// 	React.useEffect(() => {
// 		_Cast.devices.RegisterDevice().then(() => {
// 			_Cast.info.getPeerDevices().then(console.log) // .then(setCastDevices);
// 			// castSession.info.getPeerDevices().then(setCastDevices);
// 		});
// 		_Cast.set.setPlayHandler((a) => console.log("setPlayHandler: ", a));
// 		_Cast.set.setOnPeerRequestHandler((a) => console.log("setOnPeerRequestHandler: ", a));
// 	}, [])
// 	return <CastContext.Provider value={_Cast}>{children}</CastContext.Provider>
export const BottomNavigationContext = React.createContext(true);
export const BottomNavigationProvider = React.memo(({children}) => {
    const [a, b] = React.useState(true);
    return <BottomNavigationContext.Provider value={[a, b]}>{children}</BottomNavigationContext.Provider>;
});
// });
export const CastContext = React.createContext(null);
export const CastProvider = React.memo(({children}) => {
    Cast.onPlayRequest = a => console.log(`Play Requested`, a, "Context");
    const {enqueueSnackbar} = useSnackbar();
    const setLoading = React.useContext(LoadingContext)[1];
    const {playState, PlaySong} = React.useContext(PlayContext);
    React.useEffect(() => {
        Cast.devices.RegisterDevice().then(() => {
            Cast.info.getPeerDevices().then((d) => console.log("Peer Devices: ", d, "Context"));
        });
        const Events = {
            RegisterDevice: "RegisterDevice",
            DeviceListUpdate: "DevicesListUpdateEvent",

            DevicePeerConnectEvent: "DeviceConnectEvent",
            DeviceConnectAcceptEvent: "DeviceConnectAcceptEvent",

            DevicePlayEvent: "DevicePlayEvent",
            DevicePauseEvent: "DevicePauseEvent",
        };
        Cast.onPlayRequest = async (d) => {
            console.log(d);
            const {playState: _playState, remoteId} = d;
            const a = [];
            try {
                playState.audioElement.pause();
                console.log(d);
                if (_playState.others && _playState.others.offline) {
                    _playState.playList.list.items.map(song => {
                        song.videoElement.snippet.thumbnails.high.url = `https://i.ytimg.com/vi/${song.videoElement.id}/hqdefault.jpg`
                        a.push(song.videoElement);
                        // song.isOffline = true
                    });
                    PlaySong({
                        useProxy: true,
                        song: _playState.videoElement,
                        playList: a,
                        ..._playState,
                    });
                } else PlaySong({
                    useProxy: true,
                    song: _playState.videoElement,
                    ..._playState,
                });
                await playState.audioElement.play();
                enqueueSnackbar(`Playing ${_playState.videoElement.snippet.title} from ${remoteId}`);
                setLoading(false);


                // if (state.others.song.isOffline) {
                //     state.videoElement.snippet.thumbnails.high.url = URL.createObjectURL(state.others.song.blobs.thumbnail);
                //     PlaySong({
                //         useProxy: false,
                //         songURI: URL.createObjectURL(state.others.song.blobs.audio),
                //         song: state.song.videoElement,
                //         ...state,
                //         others: {
                //             song: state.song,
                //             // blobs: state.song.blobs
                //         }
                //     })
                // } else {
                //     state.videoElement.snippet.thumbnails.high.url = `https://i.ytimg.com/vi/${state.videoElement.id}/hqdefault.jpg`;
                //     playState.audioElement.src = endPoints.proxyURI(await getSong(state.videoElement.id));
                //
                //     setPlayState({
                //         audioElement: playState.audioElement,
                //         ...state,
                //     });
                // }
                // playState.audioElement.play();
                // enqueueSnackbar(`Playing ${state.videoElement.snippet.title} from ${remoteId}`);
                // setLoading(false);
            } catch (e) {
                console.log(e);
                setLoading(false);
                enqueueSnackbar("Cannot Play Song");
            }
        };
        // Someone Wants To Play
        Cast.socket.on(Events.DevicePlayEvent, Cast.onPlayRequest);
        // Someone Wants To Pause
        Cast.socket.on(Events.DevicePlayEvent, Cast.onPauseRequest);
        // Someone Wants To Connect
        Cast.socket.on(Events.DevicePeerConnectEvent, Cast.onPeerRequest);
        // Someone Accepted Request
        Cast.socket.on(Events.DeviceConnectAcceptEvent, async deviceId => {
            await set(StorageIndex.castAcceptedDevices, [...await get(StorageIndex.castAcceptedDevices), deviceId]);
            console.log("Someone Accepted Your Request, Accepted Devices", await get(StorageIndex.castAcceptedDevices));
            Cast.onPeerAccept();
        });
        // Devices Updated
        Cast.socket.on(Events.DeviceListUpdate, async devices => {
            const deviceId = await Cast.info.getDeviceId();
            await set(StorageIndex.castDevices, devices.filter(d => d !== deviceId));
            console.log("Cast Devices Updated: ", devices);
        });


    }, []);
    return <CastContext.Provider value={Cast}>{children}</CastContext.Provider>;
});
export const ThemeContext = React.createContext(null);
export const ThemeProvider = React.memo(({children}) => {
    const [darkMode, setDarkMode] = React.useState(localStorage.getItem(storageIndex.darkMode) === null ? false : JSON.parse(localStorage.getItem(storageIndex.darkMode)));
    //const matches = useMediaQuery("@media tv, (width: 1920px) and (height: 1080px), (width: 1280px) and (height: 720px)");
    const palletType = darkMode ? "dark" : "light";
    const colors = {
        primary: {
            contrastText: darkMode ? "#757575" : "#FFFFFF",
            appBarText: "#FFFFFF",
            main: "#E14A58",
            light: darkMode ? "#757575" : "#FFFFFF",
            dark: darkMode ? "#303030" : "#FFFFFF",
            miniPlayer: {
                main: darkMode ? "#303030" : "#FEFEFE",
                borderTop: darkMode ? "#E14A58" : "#3C3F41",
                text: darkMode ? "#FFFFFF" : "#2B2B2B",
            },
            player: {
                slider: {
                    rail: "#FFF",
                    thumb: "#FFF",
                    thumbColorPrimary: "#FFF"
                },
                invertButtons: {
                    main: "#E14A58",
                    invert: "#FFFFFF"
                },
                volumeSlider: {
                    main: "#000"
                }
            }
        },
        secondary: {
            main: "#E14A58",
            light: darkMode ? "#757575" : "#FFFFFF",
            dark: darkMode ? "#303030" : "#FFFFFF"
        },
        background: {},
    };

    const darkTheme = createMuiTheme({
        palette: {
            type: palletType,
            ...colors,
            Slider: {
                root: {
                    color: "#6f8eff",
                    height: 3,
                    padding: "13px 0",
                },
                track: {
                    height: 4,
                    borderRadius: 2,
                },
                thumb: {
                    height: 20,
                    width: 20,
                    backgroundColor: "#000",
                    border: "1px solid currentColor",
                    marginTop: -9,
                    marginLeft: -11,
                    boxShadow: "#ebebeb 0 2px 2px",
                    "&:focus, &:hover, &$active": {
                        boxShadow: "#ccc 0 2px 3px 1px",
                    },
                    color: "#000",
                }
            }
        }
    });

    React.useEffect(() => {
        localStorage.setItem(storageIndex.darkMode, darkMode);
    }, [darkMode])
    return <ThemeContext.Provider value={[darkMode, setDarkMode]}>
        <MuiThemeProvider theme={darkTheme}>
            {children}
        </MuiThemeProvider>
    </ThemeContext.Provider>
});
