import React from "react";
import "./App.css";
import HomeComponent from "./components/Home/home";
import {BrowserRouter as Router, Route} from "react-router-dom";
import CustomBottomNavigation from "./components/CustomBottomNavigation/CustomBottomNavigation.lazy";
import Downloads from "./components/Downloads/Downloads.lazy";
import Player from "./components/Player/Player.lazy";
import CustomAppBar from "./components/CustomAppBar/CustomAppBar.lazy";
import SearchComponent from "./components/SearchComponent/SearchComponent.lazy";
import DrawerComponent from "./components/Drawer/Drawer.lazy";
import MiniPlayer from "./components/Player/MiniPlayer.lazy";
import SearchResultComponent from "./components/SearchComponent/SearchResultComponent.lazy";
import CssBaseline from "@material-ui/core/CssBaseline";
import Settings from "./components/Settings/Settings.lazy";
import Liked from "./components/Liked/Liked.lazy";
import "bootstrap/dist/css/bootstrap-utilities.css";
import {DialogProvider} from "muibox";
import ArtistComponent from "./components/ArtistComponent/ArtistComponent.lazy";
import {FocusRoot} from "@please/lrud";
import SearchComponentTV from "./components/SearchComponentTV/SearchComponentTV.lazy";
import {
    BottomNavigationProvider,
    CastDialogProvider,
    CastProvider,
    DrawerProvider,
    isTvContext,
    LoadingProvider,
    PlayerProvider,
    PlayProvider,
    RatingProvider,
    SearchingProvider,
    ThemeProvider
} from "./Contexts";
import Discover from "./components/Discover/Discover.lazy";
import {SnackbarProvider} from "notistack";
import TrendingArtists from "./components/TrendingArtists/TrendingArtists.lazy";
import DesktopPlayer from "./components/Player/DesktopPlayer";
import CastDialog from "./components/CastingDialog/CastingDialog";
//import {Cast} from "./functions/Cast/NewNewNewCast";

const App = () => {
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
                                                           path={["/artists", "/", "/trending", "/discover", "/home", "/search", "/downloads", "/history", "/liked", "/charts"]}>
                                                        <React.Fragment>
                                                            <CustomAppBar/>
                                                            <CustomBottomNavigation/>
                                                            {/*<BackDropLoader hidden={backdrop}/>*/}
                                                        </React.Fragment>
                                                    </Route>
                                                    {/*<RatingProvider>*/}
                                                    <CastProvider>
                                                        <CastDialogProvider>
                                                            <RatingProvider>
                                                                {tv ? <DesktopPlayer/> : <Player/>}
                                                                <MiniPlayer/>
                                                                <CastDialog/>
                                                            </RatingProvider>
                                                        </CastDialogProvider>
                                                    </CastProvider>
                                                    {/*</RatingProvider>*/}
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
                                                    {/*<Route exact path={"/history"} component={HistoryComponent}/>*/}
                                                    {/*<Route exact path={"/charts"} component={PlayLists}/>*/}
                                                    <Route exact path={"/artist"} component={ArtistComponent}/>
                                                    {/*<Route exact path={"/TestArtistComponent"}*/}
                                                    {/*       component={TestArtistComponent}/>*/}
                                                    {/*Trending*/}
                                                    <Route exact path={"/artists"} component={TrendingArtists}/>
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
