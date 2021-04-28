import React from "react";
import "./App.css";
import HomeComponent from "./components/Home/home";
import {BrowserRouter as Router, Route} from "react-router-dom";
import CustomBottomNavigation from "./components/CustomBottomNavigation/CustomBottomNavigation.lazy";
import Downloads from "./components/Downloads/Downloads.lazy";
import MobilePlayer from "./components/Player/Moblie/Player.lazy";
import DesktopPlayer from "./components/Player/Desktop/Player.lazy";
import MiniPlayer from "./components/Player/MiniPlayer/MiniPlayer.lazy";
import CustomAppBar from "./components/CustomAppBar/CustomAppBar.lazy";
import SearchComponent from "./components/SearchComponent/SearchComponent.lazy";
import DrawerComponent from "./components/Drawer/Drawer.lazy";
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
import CastDialog from "./components/CastingDialog/CastingDialog";
import {ErrorComponent} from "./InternalViews/ErrorViewer";

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
                                                                {tv ? <DesktopPlayer/> : <MobilePlayer/>}
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
                                                    <Route exact path={"/artist/:id"} component={ArtistComponent}/>
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
                {/**
                 i don't know how to make a 404 route
                 **/}
                {/*<Route path="*" exact>*/}
                {/*    <div className={"errorPage text-center"}*/}
                {/*         style={{position: "absolute", top: "50%", left: "50%", transform: "translate(-50%, -50%)"}}>*/}
                {/*        <img src={"./assets/icons/darkmode_nothingfound.svg"} style={{width: "8rem", height: "auto"}}*/}
                {/*             alt={"Kabeers Music Logo"}/>*/}
                {/*        <br/>*/}
                {/*        <div>*/}
                {/*            <ListItemText primary={"404 - Page Not Found"}*/}
                {/*                          secondary={"Don’t worry, we’ll help you get where you need to go. Try searching again,"}/>*/}
                {/*        </div>*/}
                {/*        <div className={"mt-2"}>*/}
                {/*            <Button component={Link} to={"/home"}>Home</Button>*/}
                {/*            <Button component={Link} to={"/discover"}>Discover</Button>*/}
                {/*            <Button component={Link} to={"/downloads"}>Downloads</Button>*/}
                {/*            <Button component={Link} to={"/artists"}>Artists</Button>*/}
                {/*        </div>*/}
                {/*    </div>*/}
                {/*</Route>*/}

                <Route path={"/internal/error/:code/view"} component={ErrorComponent}>
                </Route>
            </ThemeProvider>
        </Router>
    );
};

export default React.memo(App);
