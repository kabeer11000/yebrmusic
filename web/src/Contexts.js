import useMediaQuery from "@material-ui/core/useMediaQuery";
import React from "react";
import {getSong, getSongDetails} from "./functions/SongsUtility";
import {AddMediaSession} from "./functions/Helper/MediaSession";
// import {Cast, Events} from "./functions/Cast/Cast";
import endPoints from "./api/EndPoints/EndPoints";
import {useSnackbar} from "notistack";
import {get, set} from "idb-keyval";
import {storageIndex} from "./functions/Helper/StorageIndex";
import {createMuiTheme, MuiThemeProvider} from "@material-ui/core/styles";
import {comLinkWorker} from "./functions/Worker/worker-export";
import Log, {DebugLog} from "./functions/Log";
import SessionRecommendation from "./functions/SessionRecommendation";
import {GetActiveAccounts, ServiceLoginRequest} from "./functions/Auth";
import {useNetwork} from "./Hooks";
import {RetrievalDeleteLS} from "./functions/Helper/RetrievalDeleteLS";

export const CastDialogContext = React.createContext(false);
export const CastDialogProvider = ({children}) => {
    const [a, b] = React.useState(false);
    return <CastDialogContext.Provider value={[a, b]}>{children}</CastDialogContext.Provider>;
};


export const isTvContext = React.createContext(false);
export const IsTvProvider = ({children}) => {
    const isTv = useMediaQuery("(min-width:600px)");
    Log("Desktop", isTv);
    return <isTvContext.Provider value={isTv}>{children}</isTvContext.Provider>;
};

export class OfflineToken {
    constructor() {
    }
}

/** BHAI IDHAR HI TOKEN KI VALUE BE SAVE KARDO. PHIR HAHR COMPONENT MAI CONDITIONAL LOGIC **/
export const AccountContext = React.createContext(null);
export const AccountProvider = React.memo(({children}) => {
    const [account, setAccount] = React.useState(null);
    const {sessions} = React.useContext(AccountChooserContext);
    const [token, setToken] = React.useState(null);
    const online = useNetwork();
    // const history = useHistory();
    /*React.useEffect(() => void new Promise(async () => {
        const {serviceLoginToken: token, dataServerToken} = (await ServiceLoginRequest(null));
        setToken(token || new Error("An Error Occurred, Failed to get Service Login Key"));
        window.__kn.music.serviceLoginToken = token || new Error("An Error Occurred, Failed to get Service Login Key");
        window.__kn.music["data-collection"].token = dataServerToken;
    }), [online])*/

    React.useEffect(() => void new Promise(async () => {
        if (online) {
            const accounts = await GetActiveAccounts();
            sessions[1](accounts);
            const authuserParam = parseInt(new URLSearchParams(window.location.search).get(storageIndex.AuthUserParam));
            const u = (authuserParam > accounts.active.length ? 0 : authuserParam) || await RetrievalDeleteLS.get(storageIndex.cookies.AuthUser) || 0;
            const account = accounts.active[u];
            if (account) {
                setAccount(account);
                await set(storageIndex.cookies.UserData, account);
                await set(storageIndex.cookies.AuthUser, u);
                const {
                    public_grant,
                    serviceLoginToken: token,
                    dataServerToken
                } = (await ServiceLoginRequest(accounts.all.findIndex(a => a.user_id === account.user_id)));
                setToken(public_grant ? new OfflineToken() : (token || new Error("An Error Occurred, Failed to get Service Login Key")));
                window.__kn.music.serviceLoginToken = token || new Error("An Error Occurred, Failed to get Service Login Key");
                window.__kn.music.auth.authUser = u;
                window.__kn.music.auth.user = account;
                window.__kn.music["data-collection"].token = dataServerToken;
            } else {
                const {public_grant, serviceLoginToken: token, dataServerToken} = (await ServiceLoginRequest(null));
                setToken(public_grant ? new OfflineToken() : (token || new Error("An Error Occurred, Failed to get Service Login Key")));
                window.__kn.music.serviceLoginToken = token || new Error("An Error Occurred, Failed to get Service Login Key");
                window.__kn.music["data-collection"].token = dataServerToken;
            }
            // history.push(`/u/${u}${window.location.pathname}`)
        } else {
            const account = await get(storageIndex.cookies.UserData);
            if (account) {
                setAccount(account);
                sessions[1]({
                    all: [account],
                    active: [account],
                    offline: true
                });
                setToken(new OfflineToken());
                window.__kn.music.auth.authUser = await get(storageIndex.cookies.AuthUser);
                window.__kn.music.auth.user = account;
            } else {
                setToken(new OfflineToken());
                window.__kn.music.serviceLoginToken = new OfflineToken();
                window.__kn.music["data-collection"].token = new OfflineToken();
            }
        }
    }), [online]);

    return <AccountContext.Provider value={{account, setAccount, token, setToken}}>{children}</AccountContext.Provider>;
});
export const AccountChooserContext = React.createContext(false);
export const AccountChooserProvider = React.memo(({children}) => {
    const [open, setOpen] = React.useState(false);
    const [accounts, setAccounts] = React.useState({
        all: [],
        active: []
    });
    return (
        <AccountChooserContext.Provider value={{dialog: [open, setOpen], sessions: [accounts, setAccounts]}}>
            {children}
        </AccountChooserContext.Provider>
    );
});

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
export const PlayerContext = React.createContext({
    Dialog: false,
    MiniPlayer: false
});
export const PlayerProvider = React.memo(({children}) => {
    const [a, b] = React.useState({
        Dialog: false,
        MiniPlayer: false
    });
    return <PlayerContext.Provider value={[a, b]}>{children}</PlayerContext.Provider>;
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
        times_streamed: 1,
    });
    const UpdateState = async ({is_casting, explicit_rating, viewed_artist}) => {
        try {
            // const response = await comLinkWorker.fetch(endPoints.DataCollection.details.getStreams(window.__kn.music["data-collection"].token.access_token), {
            //     method: "post",
            //     body: JSON.stringify({id: playState.videoElement.id}),
            // });
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
                    times_streamed: rating.times_streamed,
                })
            });
            setRating({
                is_casting,
                repeat_enabled: window.__kn.music.audio.loop ? 1 : 0.5,
                player_type: playState.Dialog ? 1 : 0.5,
                volume: window.__kn.music.audio.volume,
                explicit_rating,
                watch_percent: window.__kn.music.audio.currentTime / window.__kn.music.audio.duration,
                viewed_artist: viewed_artist ? 1 : 0,
                times_streamed: rating.times_streamed,
            });

        } catch (e) {
            console.log(e);
            Log("Exception: ", e);
        }
    };

    // useInterval(async (next) => {
    //     console.log("useInterval Called")
    //     if (!playState.videoElement) {
    //         console.log("Returned", playState)
    //         return next();
    //     }
    //     console.log("UpdateRating");
    //     await UpdateState({
    //         is_casting: rating.is_casting,
    //         explicit_rating: rating.explicit_rating,
    //         viewed_artist: rating.viewed_artist
    //     });
    //     Log("Updated-Rating");
    //     next();
    // }, 6000);
    // React.useEffect(() => {
    //     let interval
    //
    //     const start = () => {
    //         clearInterval(interval)
    //         interval = setInterval(() => handler(start), delay)
    //     }
    //
    //     if (!playState.videoElement) return clearInterval(interval);
    //     handler(start)
    //
    //     return () => clearInterval(interval)
    // }, [playerState.videoElement]);
    // const [timer, setTimer] = React.useState(0);
    // React.useEffect(() => {
    // 	setInterval(() => setTimer(timer + 1 ), 5000);
    // }, []);
    // React.useEffect(() => {
    //     if (playState.videoElement) {
    //         const timer = setInterval(async () => {
    //             if (!playState.videoElement) return clearInterval(timer) && console.log("Returned From Interval");
    //             await UpdateState({
    //                 is_casting: rating.is_casting,
    //                 explicit_rating: rating.explicit_rating,
    //                 viewed_artist: rating.viewed_artist
    //             });
    //             Log("Updated-Rating");
    //         }, 6000);
    //         return () => {
    //             console.log("Setimeout Return called")
    //             // clearInterval(timer);
    //         }
    //     }
    // }, [playState.videoElement]);
    // React.useEffect(() => console.log(timer), [timer]);
    /*
        React.useEffect(() => {
            if (playState.videoElement && window.__kn.music["data-collection"].token?.access_token) comLinkWorker.fetch(endPoints.DataCollection.details.getStreams(window.__kn.music["data-collection"].token.access_token), {
                method: "post",
                body: JSON.stringify({id: playState.videoElement.id}),
            }).then(async response => {
                await UpdateState({
                    is_casting: rating.is_casting,
                    explicit_rating: rating.explicit_rating,
                    viewed_artist: rating.viewed_artist
                });
                setRating({
                    ...rating,
                    times_streamed: response.times_streamed + 1,
                });
            });
        }, [timer]); // playState.videoElement
    */
    return <RatingContext.Provider value={{rating, setRating, UpdateState}}>{children}</RatingContext.Provider>;
};
export const PlayContext = React.createContext({
    audioElement: window.__kn.music.audio,
    videoElement: null,
    playList: null,
    others: {},
    autoPlay: false
});
export const PlayProvider = React.memo(({children}) => {
    const {enqueueSnackbar} = useSnackbar();
    const [playerState, setPlayerState] = React.useContext(PlayerContext);
    // const {rating, UpdateState: UpdateRatingState} = React.useContext(RatingContext);
    const [playState, setPlayState] = React.useState({
        audioElement: window.__kn.music.audio,
        videoElement: null,
        playList: null,
        others: {},
        autoPlay: localStorage.getItem("__kn.music.web.options.autoplay") ? JSON.parse(localStorage.getItem("__kn.music.web.options.autoplay")) : true
    });
    const tv = React.useContext(isTvContext);
    const setLoading = React.useContext(LoadingContext)[1];
    const SkipSong = async (song, index, componentState = playerState, options = {}) => {
        /** Unload Song Blob URL of previous audio **/
        if (playState.others.offline) URL.revokeObjectURL(playState.audioElement.src);
        // if (playState.others.offline) URL.revokeObjectURL(playState.playList.list[playState.playList.index]?.videoElement.snippet.thumbnails.high.url);
        /** If Offline Proceed calling play with offline prop. and creating song_url source from blob **/
        if (playState.others.offline) await PlaySong({
            useProxy: false,
            others: {
                offline: true
            },
            componentState,
            play: true,
            songURI: URL.createObjectURL(song.blobs.audio),
            song: song,//.videoElement,
            playList: {
                ...playState.playList,
                // list: !options.filter_current ? playState.playList.list : {...playState.playList.list, items: playState.playList.list?.items.filter(s => s.id !== song.id)},
                index: index
            }
        });
        /** Else call the `PlaySong` without the songUri prop and let it fetch song source from the server **/
        else await PlaySong({
            useProxy: true,
            song: song,
            componentState,
            play: true,
            playList: {
                ...playState.playList,
                // list: !options.filter_current ? playState.playList.list : {...playState.playList.list, items: playState.playList.list?.items.filter(s => s.id !== song.id)},
                index: index
            }
        });
    };
    const AutoPlay = (autoplay) => {
        if (autoplay) playState.audioElement.onended = async () => {
            if (playState.playList?.list.items[playState.playList?.index + 1]) await SkipSong(playState.playList.list.items[playState.playList.index + 1], playState.playList.index + 1);
        };
        else playState.audioElement.onended = null;
        setPlayState({...playState, autoPlay: autoplay});
        Log("auto-playing: ", autoplay);
    };
    //TODO 3D Audio Feature
    React.useEffect(() => {
        const params = new URLSearchParams(window.location.search);
        const id = params.get("play");
        if (!id) return;
        const song = getSongDetails(id);
        if (song) song.then(a => PlaySong({
            play: false,
            useProxy: true,
            song: a,
            // ...params.get("player") ? {
            componentState: {
                Dialog: params.get("player") === "dialog" ? true : !["mini", "dialog"].includes(params.get("player")),
                MiniPlayer: params.get("player") === "mini"
            }
            // } : {}
        }));
    }, []);
    React.useEffect(() => {
        if (playState.videoElement && playState.autoPlay) playState.audioElement.onended = async () => (playState.playList?.list.items[playState.playList?.index + 1]) && await SkipSong(playState.playList.list.items[playState.playList.index + 1], playState.playList.index + 1);
    }, [playState]);
    const PlaySong = async ({song, playList, componentState, useProxy, others = {}, ...options}) => {
        if (!song) return;
        try {
            setLoading(true);
            await playState.audioElement.pause();
            if (playState.others.offline) URL.revokeObjectURL(playState.audioElement.src);
            if (useProxy) {
                const songURI = await getSong(song.id);
                playState.audioElement.src = endPoints.proxyURI(songURI);
            } else playState.audioElement.src = options["songURI"];
            setPlayState({
                ...playState,
                videoElement: song,
                playList: playList,
                others: others || playState.others
            });
            setPlayerState(componentState || {
                Dialog: !tv,
                MiniPlayer: tv
            });
            await AddMediaSession({
                artist: others && others.offline ? song.videoElement.snippet.channelTitle : song.snippet.channelTitle,
                title: others && others.offline ? song.videoElement.snippet.title : song.snippet.title,
                artwork: [{
                    src: others && others.offline ? song.videoElement.snippet.thumbnails.high.url : song.snippet.thumbnails.high.url,
                    sizes: "96x96",
                    type: "image/png"
                }]
            }, {
                playAudio: () => playState.audioElement.play(),
                pauseAudio: () => playState.audioElement.pause()
            }, playState.audioElement);
            document.title = `${others && others.offline ? song.videoElement.snippet.title : song.snippet.title} - Yebr Music`;
            if (options.play) await playState.audioElement.play();
            setLoading(false);
            return others && others.offline ? await SessionRecommendation.addWatch({
                song: others && others.offline ? song.videoElement : song,
                playerState: playerState
            }) : null;
        } catch (e) {
            DebugLog("An Error Occurred: ", e);
            setLoading(false);
            enqueueSnackbar("Error: " + e.message);
        }
    };
    // React.useEffect(() => {
    //     DebugLog("PlayStateChanged");
    //     // if (playState.videoElement) {
    //     //     setInterval(async () => {
    //     //         console.log(rating);
    //     //         // await UpdateRatingState({is_casting: rating.is_casting, explicit_rating: rating.explicit_rating, viewed_artist: rating.viewed_artist});
    //     //         Log("Updated-Rating");
    //     //     }, 7000);
    //     // }
    // }, [playState]);
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
/*
export const CastContext = React.createContext(null);
export const CastProvider = React.memo(({children}) => {
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
            await set(storageIndex.castAcceptedDevices, [...await get(storageIndex.castAcceptedDevices), deviceId]);
            Log("Someone Accepted Your Request, Accepted Devices : ", await get(storageIndex.castAcceptedDevices));
            Cast.onPeerAccept();
        });
        // Devices Updated
        Cast.socket.on(Events.DeviceListUpdate, async devices => {
            const deviceId = await Cast.info.getDeviceId();
            await set(storageIndex.castDevices, devices.filter(d => d !== deviceId));
            Log("Cast Devices Updated: ", devices);
        });
    }, []);
    return <CastContext.Provider value={Cast}>{children}</CastContext.Provider>;
});
 */
export const ThemeContext = React.createContext(null);
export const ThemeProvider = React.memo(({children}) => {
    const [darkMode, setDarkMode] = React.useState(localStorage.getItem(storageIndex.darkMode) === null ? false : JSON.parse(localStorage.getItem(storageIndex.darkMode)));
    //const matches = useMediaQuery("@media tv, (width: 1920px) and (height: 1080px), (width: 1280px) and (height: 720px)");
    const palletType = darkMode ? "dark" : "light";
    const colors = {
        primary: {
            contrastText: darkMode ? "#757575" : "#FFFFFF",
            appBarText: "#FFFFFF",
            main: !darkMode ? "#ac1111" : "#E14A58",
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
                    main: !darkMode ? "#ac1111" : "#E14A58",
                    invert: "#FFFFFF"
                },
                volumeSlider: {
                    main: "#000"
                }
            }
        },
        secondary: {
            main: !darkMode ? "#ac1111" : "#E14A58",
            light: darkMode ? "#757575" : "#FFFFFF",
            dark: darkMode ? "#303030" : "#FFFFFF"
        },
        ...(darkMode && {
            background: {
                default: "#1D1D1D" || "#121212",
                paper: "#343434" || "#282828"
            }
        }),
        colors: {
            grey: "#222327"
        }
    };
    const slider = {
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
    };
    const darkTheme = createMuiTheme({
        palette: {
            type: palletType,
            ...colors,
            Slider: slider
        }
    });

    React.useEffect(() => {
        localStorage.setItem(storageIndex.darkMode, darkMode);
    }, [darkMode]);
    return (
        <ThemeContext.Provider value={[darkMode, setDarkMode, {slider, colors, darkTheme}]}>
            <MuiThemeProvider theme={darkTheme}>
                {children}
            </MuiThemeProvider>
        </ThemeContext.Provider>
    );
});
