import useMediaQuery from "@material-ui/core/useMediaQuery";
import React from "react";
import {getSong, getSongDetails} from "./functions/songs";
import addMediaSession from "./functions/Helper/addMediaSession";
import {Cast, Events} from "./functions/Cast/NewNewCast";
import endPoints from "./api/endpoints/endpoints";
import {useSnackbar} from "notistack";
import {get, set} from "idb-keyval";
import {storageIndex, storageIndex as StorageIndex} from "./functions/Helper/storageIndex";
import {createMuiTheme, MuiThemeProvider} from "@material-ui/core/styles";
import {comLinkWorker} from "./functions/Worker/worker-export";
import Log, {DebugLog} from "./functions/Log";

// const comlinkWorker = Comlink.wrap(new Worker("./comlink-worker.js"));
export const CastDialogContext = React.createContext(false);
export const CastDialogProvider = ({children}) => {
    const [a, b] = React.useState(false);
    return <CastDialogContext.Provider value={[a, b]}>{children}</CastDialogContext.Provider>;
};


export const isTvContext = React.createContext(false);
export const IsTvProvider = ({children}) => {
    const isTv = useMediaQuery("(min-width:600px)");
    console.log("isDesktop", isTv);
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
//window.__kn.music["data-collection"].token.access_token
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
export const RatingContext = React.createContext({});
export const RatingProvider = ({children}) => {
    const [playerState] = React.useContext(PlayerContext);
    const {playState} = React.useContext(PlayContext);
    const [rating, setRating] = React.useState({
        is_casting: 0,
        repeat_enabled: window.__kn.music.audio.loop ? 1 : 0.5,
        player_type: playerState.Dialog ? 1 : 0.5,
        volume: window.__kn.music.audio.volume,
        explicit_rating: 0,
        watch_percent: window.__kn.music.audio.currentTime / window.__kn.music.audio.duration,
        viewed_artist: 0,
        times_streamed: 0,
    });
    const UpdateState = async ({is_casting, explicit_rating, viewed_artist}) => {
        try {
            const response = await comLinkWorker.fetch(endPoints.DataCollection.details.getStreams(window.__kn.music["data-collection"].token.access_token), {
                method: "post",
                body: JSON.stringify({id: playState.videoElement.id}),
            })
            setRating({
                is_casting,
                repeat_enabled: window.__kn.music.audio.loop ? 1 : 0.5,
                player_type: playState.Dialog ? 1 : 0.5,
                volume: window.__kn.music.audio.volume,
                explicit_rating,
                watch_percent: window.__kn.music.audio.currentTime / window.__kn.music.audio.duration,
                viewed_artist: viewed_artist ? 1 : 0,
                times_streamed: parseInt(response.times_streamed) + 1,
            });
            await comLinkWorker.fetch(endPoints.DataCollection.rate({
                id: playState.videoElement.id,
                token: window.__kn.music["data-collection"].token.access_token
            }), {
                method: "post",
                body: JSON.stringify({
                    is_casting,
                    repeat_enabled: window.__kn.music.audio.loop ? 1 : 0.5,
                    player_type: playState.Dialog ? 1 : 0.5,
                    volume: window.__kn.music.audio.volume,
                    explicit_rating,
                    watch_percent: window.__kn.music.audio.currentTime / window.__kn.music.audio.duration,
                    viewed_artist: viewed_artist ? 1 : 0,
                    times_streamed: parseInt(response.times_streamed) + 1,
                })
            });
        } catch (e) {
            Log("Exception: ", e);
        }
    }
    React.useEffect(() => {
        if (playState.videoElement && window.__kn.music["data-collection"].token?.access_token) return comLinkWorker.fetch(endPoints.DataCollection.details.getStreams(window.__kn.music["data-collection"].token.access_token), {
            method: "post",
            body: JSON.stringify({id: playState.videoElement.id}),
        }).then(response => {
            console.log(response);
            // setRating({
            //     ...rating,
            //     times_streamed: parseInt(response.times_streamed),
            // });
        });
    }, [playState.videoElement]);
    return <RatingContext.Provider value={{rating, setRating, UpdateState}}>{children}</RatingContext.Provider>;
}
export const PlayContext = React.createContext({
    audioElement: window.__kn.music.audio,
    videoElement: null,
    playList: null,
    others: null,
    autoPlay: false
});
export const PlayProvider = React.memo(({children}) => {
    const {enqueueSnackbar} = useSnackbar();
    const [, setPlayerState] = React.useContext(PlayerContext);
    const {rating: rating, UpdateState: UpdateRatingState} = React.useContext(RatingContext);
    const [playState, setPlayState] = React.useState({
        audioElement: window.__kn.music.audio,
        videoElement: null,
        playList: null,
        others: null,
        autoPlay: false
    });
    const tv = React.useContext(isTvContext);
    const setLoading = React.useContext(LoadingContext)[1];
    const SkipSong = async (song, index) => {
        if (!song) return;
        if (song.isOffline) await PlaySong({
            useProxy: false,
            songURI: URL.createObjectURL(song.blobs.audio),
            song: song.videoElement,
            playList: {
                ...playState.playList,
                index: index
            }
        });
        else await PlaySong({
            useProxy: true,
            song: song,
            playList: {
                ...playState.playList,
                index: index
            }
        });
    };
    const AutoPlay = (autoplay) => {
        if (autoplay) playState.audioElement.onended = async () => {
            if (playState.playList.list.items[playState.playList.index + 1]) await SkipSong(playState.playList.list.items[playState.playList.index + 1], playState.playList.index + 1);
        };
        else playState.audioElement.onended = null;
        Log("auto-playing: ", autoplay);
    };
    //TODO 3D Audio Feature
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
        }
        a()
    }, []);
    const PlaySong = async ({song, playList, componentState, useProxy, others, ...options}) => {
        setLoading(true);
        // const {song, playList, componentState, useProxy, others} = options;
        try {
            await playState.audioElement.pause();
            if (useProxy) {
                const songURI = await getSong(song.id);
                playState.audioElement.src = endPoints.proxyURI(songURI);
            } else playState.audioElement.src = options["songURI"];
            setPlayState({
                ...playState,
                videoElement: song,
                playList: playList,
                others: others
            });
            setPlayerState(componentState || ({
                Dialog: !tv,
                MiniPlayer: tv
            }));
            await addMediaSession({
                artist: others?.offline ? song.videoElement.snippet.channelTitle : song.snippet.channelTitle,
                title: others?.offline ? song.videoElement.snippet.title : song.snippet.title,
                artwork: [{
                    src: others?.offline ? song.videoElement.snippet.thumbnails.high.url : song.snippet.thumbnails.high.url,
                    sizes: "96x96",
                    type: "image/png"
                }]
            }, {
                playAudio: () => playState.audioElement.play(),
                pauseAudio: () => playState.audioElement.pause()
            }, playState.audioElement);
            await playState.audioElement.play();
            setLoading(false);
        } catch (e) {
            setLoading(false);
            enqueueSnackbar("Error: " + e.message, " Occurred at: ", e.lineNumber);
        }
    };

    React.useEffect(() => {
        DebugLog("PlayStateChanged");
        if (playState.videoElement) {
            setInterval(async () => {
                console.log(rating);
                // await UpdateRatingState({is_casting: rating.is_casting, explicit_rating: rating.explicit_rating, viewed_artist: rating.viewed_artist});
                Log("Updated-Rating");
            }, 7000);
        }
    }, [playState]);
    return <PlayContext.Provider
        value={{playState, setPlayState, SkipSong, AutoPlay, PlaySong}}>{children}</PlayContext.Provider>;
});
export const SearchContext = React.createContext(null);
export const SearchingProvider = React.memo(({children}) => {
    const [query, setQuery] = React.useState(null);
    return <SearchContext.Provider value={[query, setQuery]}>{children}</SearchContext.Provider>;
});
export const BottomNavigationContext = React.createContext(true);
export const BottomNavigationProvider = React.memo(({children}) => {
    const [a, b] = React.useState(true);
    return <BottomNavigationContext.Provider value={[a, b]}>{children}</BottomNavigationContext.Provider>;
});
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
        Cast.onPlayRequest = async ({playState: remotePlayState, remoteId}) => {
            Log("Remote Play Requested - RemoteID: ", remoteId);
            try {
                playState.audioElement.pause();
                if (remotePlayState.others && remotePlayState.others.offline) PlaySong({
                    useProxy: true,
                    song: remotePlayState.videoElement,
                    playList: remotePlayState.playList.list.items.map(song => {
                        song.videoElement.snippet.thumbnails.high.url = `https://i.ytimg.com/vi/${song.videoElement.id}/hqdefault.jpg`;
                        song.isOffline = true;
                        return (song.videoElement);
                    }),
                    ...remotePlayState,
                });
                else PlaySong({
                    useProxy: true,
                    song: remotePlayState.videoElement,
                    ...remotePlayState,
                });
                await playState.audioElement.play();
                enqueueSnackbar(`Playing ${remotePlayState.videoElement.snippet.title} from ${remoteId}`);
                setLoading(false);
            } catch (e) {
                Log(`An Error Occured: ${e.message}`);
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
            Log("Someone Accepted Your Request, Accepted Devices : ", await get(StorageIndex.castAcceptedDevices));
            Cast.onPeerAccept();
        });
        // Devices Updated
        Cast.socket.on(Events.DeviceListUpdate, async devices => {
            const deviceId = await Cast.info.getDeviceId();
            await set(StorageIndex.castDevices, devices.filter(d => d !== deviceId));
            Log("Cast Devices Updated: ", devices);
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
