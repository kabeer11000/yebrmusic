import React from "react";
import "./App.css";
import HomeComponent from "./components/Home/home.lazy";
import {BrowserRouter as Router, Route} from "react-router-dom";
import CustomBottomNavigation from "./components/CustomBottomNavigation/CustomBottomNavigation.lazy";
import Downloads from "./components/Downloads/Downloads.lazy";
import Player from "./components/Player/Player.lazy";
import CustomAppBar from "./components/CustomAppBar/CustomAppBar.lazy";
import SearchComponent from "./components/SearchComponent/SearchComponent.lazy";
import DrawerComponent from "./components/Drawer/Drawer.lazy";
import MiniPlayer from "./components/Player/MiniPlayer.lazy";
import SearchResultComponent from "./components/SearchComponent/SearchResultComponent.lazy";
import HistoryComponent from "./components/History/History.lazy";
import CssBaseline from "@material-ui/core/CssBaseline";
import Settings from "./components/Settings/Settings.lazy";
import Liked from "./components/Liked/Liked.lazy";
import "bootstrap/dist/css/bootstrap-utilities.css";
import {DialogProvider} from "muibox";
import PlayLists from "./components/PlayLists/PlayLists.lazy";
import ArtistComponent from "./components/ArtistComponent/ArtistComponent.lazy";
import {FocusRoot} from "@please/lrud";
import SearchComponentTV from "./components/SearchComponentTV/SearchComponentTV.lazy";
import {
    BottomNavigationProvider,
    CastProvider,
    DrawerProvider,
    isTvContext,
    LoadingProvider,
    PlayerProvider,
    PlayProvider,
    SearchingProvider,
    ThemeProvider
} from "./Contexts";
import Discover from "./components/Discover/Discover.lazy";
import {SnackbarProvider} from "notistack";
import TrendingArtists from "./components/TrendingArtists/TrendingArtists.lazy";
import TestArtistComponent from "./components/ArtistComponent/BB";
//import {Cast} from "./functions/Cast/NewNewNewCast";

const App = () => {
    // const cast = new Cast({
    //     onPlayEvent: (d) => console.log("CastJS: PlayEventCalled", d)
    // });
//   blacklist: [/^\/cast/,/^\/api/,/^\/auth/],
// 	const {enqueueSnackbar, closeSnackbar} = useSnackbar();
//     const audio = document.getElementById("MainAudio-KabeersMusic");
    // const s = (e) => console.log("Saving History");
    // React.useEffect(() => {
    // 	audio.addEventListener("loadedmetadata", s);
    // 	return () => audio.removeEventListener("loadedmetadata", s);
    // }, []);
    // const cutCurrentSongState = async () => {
    // 	audio.pause();
    // 	const e = store.getState().currentSong;
    // 	return store.dispatch(setCurrentSongState(new Audio(""), e.videoElement, {
    // 		Dialog: false,
    // 		MiniPlayer: false
    // 	}, e.reOpenDialog, e.playList)), audio.src = "#", setMainState(prevState => ({
    // 		...prevState,
    // 		player: false,
    // 	})), closeSnackbar();
    // };
    // setCastDeviceUpdateListener(true, (e) => console.log);
    // setCastDeviceRemoveListener(true, cutCurrentSongState);
    // useBeforeunload(unRegisterDevice);
    // setCastDevicePlayListener(true, (e) => (e = JSON.parse(e.data), getSong(e.video.snippet.id).then(value => value ? (changeStates({
    // 	uri: value,
    // 	thumbnail: e.video.snippet.thumbnails.high.url,
    // 	video: e.video,
    // 	list: {items: [e.video]},
    // 	index: 0
    // }), enqueueSnackbar(`Casting ${e.video.snippet.title} from ${e.deviceId}`)) : null)));
    // const [darkMode, setDarkMode] = React.useState(localStorage.getItem(storageIndex.darkMode) === null ? false : JSON.parse(localStorage.getItem(storageIndex.darkMode)));
    //const matches = useMediaQuery("@media tv, (width: 1920px) and (height: 1080px), (width: 1280px) and (height: 720px)");
    // const palletType = darkMode ? "dark" : "light";
    // const colors = {
    //     primary: {
    //         contrastText: darkMode ? "#757575" : "#FFFFFF",
    //         appBarText: "#FFFFFF",
    //         main: "#E14A58",
    //         light: darkMode ? "#757575" : "#FFFFFF",
    //         dark: darkMode ? "#303030" : "#FFFFFF",
    //         miniPlayer: {
    //             main: darkMode ? "#303030" : "#FEFEFE",
    //             borderTop: darkMode ? "#E14A58" : "#3C3F41",
    //             text: darkMode ? "#FFFFFF" : "#2B2B2B",
    //         },
    //         player: {
    //             slider: {
    //                 rail: "#FFF",
    //                 thumb: "#FFF",
    //                 thumbColorPrimary: "#FFF"
    //             },
    //             invertButtons: {
    //                 main: "#E14A58",
    //                 invert: "#FFFFFF"
    //             },
    //             volumeSlider: {
    //                 main: "#000"
    //             }
    //         }
    //     },
    //     secondary: {
    //         main: "#E14A58",
    //         light: darkMode ? "#757575" : "#FFFFFF",
    //         dark: darkMode ? "#303030" : "#FFFFFF"
    //     },
    //     background: {},
    // };
    //
    // const darkTheme = createMuiTheme({
    //     palette: {
    //         type: palletType,
    //         ...colors,
    //         Slider: {
    //             root: {
    //                 color: "#6f8eff",
    //                 height: 3,
    //                 padding: "13px 0",
    //             },
    //             track: {
    //                 height: 4,
    //                 borderRadius: 2,
    //             },
    //             thumb: {
    //                 height: 20,
    //                 width: 20,
    //                 backgroundColor: "#000",
    //                 border: "1px solid currentColor",
    //                 marginTop: -9,
    //                 marginLeft: -11,
    //                 boxShadow: "#ebebeb 0 2px 2px",
    //                 "&:focus, &:hover, &$active": {
    //                     boxShadow: "#ccc 0 2px 3px 1px",
    //                 },
    //                 color: "#000",
    //             }
    //         }
    //     }
    // });
    // const handleThemeChange = () => {
    // setDarkMode(!darkMode);
    // localStorage.setItem(storageIndex.darkMode, JSON.stringify(!darkMode));
    // };

    const tv = React.useContext(isTvContext);
    return (
        <Router>
            <ThemeProvider>
                <DialogProvider>
                    <CssBaseline/>
                    <FocusRoot className="App">
                        <BottomNavigationProvider>
                            <DrawerProvider>
                                <DrawerComponent>
                                    <SnackbarProvider maxSnack={1}>
                                        <LoadingProvider>
                                            <PlayerProvider>
                                                <PlayProvider>
                                                    <Route exact
                                                           path={["/", "/trending", "/discover", "/home", "/search", "/downloads", "/history", "/liked", "/charts"]}>
                                                        <React.Fragment>
                                                            <CustomAppBar/>
                                                            <CustomBottomNavigation/>
                                                            {/*<BackDropLoader hidden={backdrop}/>*/}
                                                        </React.Fragment>
                                                    </Route>
                                                    <CastProvider>
                                                        <Player/>
                                                        <MiniPlayer/>
                                                    </CastProvider>
                                                    <Route exact path={["/home", "/"]} component={HomeComponent}/>
                                                    <Route exact path={"/downloads"} component={Downloads}/>
                                                    <SearchingProvider>
                                                        {
                                                            tv ? (
                                                                <React.Fragment>
                                                                    <Route exact path={"/search"}
                                                                           component={SearchComponentTV}/>
                                                                </React.Fragment>
                                                            ) : (
                                                                <React.Fragment>
                                                                    <Route exact={true} path={"/search/results"}
                                                                           component={SearchResultComponent}/>
                                                                    <Route exact path={"/search"}
                                                                           component={SearchComponent}/>
                                                                </React.Fragment>
                                                            )
                                                        }
                                                    </SearchingProvider>
                                                    <Route exact path={"/liked"} component={Liked}/>
                                                    <Route exact path={"/settings"} component={Settings}/>
                                                    <Route exact path={"/discover"} component={Discover}/>
                                                    <Route exact path={"/history"} component={HistoryComponent}/>
                                                    <Route exact path={"/charts"} component={PlayLists}/>
                                                    <Route exact path={"/artist"} component={ArtistComponent}/>
                                                    <Route exact path={"/TestArtistComponent"}
                                                           component={TestArtistComponent}/>
                                                    <Route exact path={"/trending"} component={TrendingArtists}/>
                                                    {
                                                        /*
                                                    <Route path={"*"} component={<NotFoundComponent/>}/>
                                                    <Route path={"*"} component={<NotFoundComponent/>}/>

                                                    <Route render={()=>errorPage('Route Not Found, 404', ()=>{}, <Button
                                                        onClick={()=>{window.location.href = ('/home')}}>Go Home</Button>)}/>
                                                         */
                                                    }
                                                </PlayProvider>
                                            </PlayerProvider>
                                        </LoadingProvider>
                                    </SnackbarProvider>
                                </DrawerComponent>
                            </DrawerProvider>
                        </BottomNavigationProvider>
                    </FocusRoot>
                </DialogProvider>
            </ThemeProvider>
        </Router>
    );
};

export default React.memo(App);
