import React from "react";
import "./App.css";
import HomeComponent from "./components/Home/home.lazy";
import {BrowserRouter as Router, Route, Switch} from "react-router-dom";
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
import "bootstrap/dist/css/bootstrap.min.css";
import {DialogProvider} from "muibox";
import ArtistComponent from "./components/ArtistComponent/ArtistComponent.lazy";
import {FocusRoot} from "@please/lrud";
import SearchComponentTV from "./components/SearchComponentTV/SearchComponentTV.lazy";
import {
    AccountChooserProvider,
    AccountContext,
    AccountProvider,
    BottomNavigationProvider,
    DrawerProvider,
    isTvContext,
    LoadingContext,
    LoadingProvider,
    OfflineToken,
    PlayerProvider,
    PlayProvider,
    RatingProvider,
    SearchingProvider,
    ThemeProvider
} from "./Contexts";
import Discover from "./components/Discover/Discover.lazy";
import {SnackbarProvider} from "notistack";
import TrendingArtists from "./components/TrendingArtists/TrendingArtists.lazy";
import {ConnectionError, ErrorComponent} from "./InternalViews/ErrorViewer";
import AccountChooser from "./components/AccountChooser/AccountChooser.lazy";
import LinearProgress from "@material-ui/core/LinearProgress";
import {CircularProgress} from "@material-ui/core";

const AppRenderer = ({children}) => {
    const {token} = React.useContext(AccountContext);
    return <React.Fragment>
        {token && !(token instanceof Error) ? (
            <app-container>{children}</app-container>) : !token && !(token instanceof Error) ?
            (token instanceof OfflineToken) ? <app-container>{children}</app-container> : <div style={{
                position: "absolute",
                left: "50%",
                top: "50%",
                transform: "translate(-50%,-50%)",
            }}><CircularProgress/></div> : (
                <app-container>
                    <ConnectionError/>
                </app-container>
            )}
        <AccountChooser/>
    </React.Fragment>;
};
const Admin = ({children}) => (
    <Switch>
        {children}
        <Route path={"/admin/create"} component={() => (<div>Feature Not Implemented Yet</div>)}/>
    </Switch>
);
const LoadingIndicator = () => {
    const [loading] = React.useContext(LoadingContext);
    return (
        <div style={{zIndex: "99999"}} hidden={!loading} className={"fixed-top"}>
            <LinearProgress/>
        </div>
    )
}
const App = () => {
    const tv = React.useContext(isTvContext);
    return (
        <ThemeProvider>
            <Router>
                <DialogProvider>
                    <CssBaseline/>
                    <FocusRoot className="App">
                        <AccountChooserProvider>
                            <AccountProvider>
                                <Route path="/admin" component={Admin}/>
                                <Route exact
                                       path={["/artist/:id", "/artists", "/", "/trending", "/discover", "/home", "/suggest", "/search", "/downloads", "/history", "/liked", "/charts", "/search/results", "/settings"]}>
                                    <AppRenderer>
                                        <BottomNavigationProvider>
                                            <DrawerProvider>
                                                <DrawerComponent>
                                                    <SnackbarProvider maxSnack={3}>
                                                        <LoadingProvider>
                                                            <LoadingIndicator/>
                                                            <PlayerProvider>
                                                                <PlayProvider>
                                                                    <Route exact
                                                                           path={["/artists", "/", "/trending", "/discover", "/home", "/downloads", "/history", "/liked", "/charts", tv ? "/search" : "/"]}>
                                                                        <React.Fragment>
                                                                            <CustomAppBar/>
                                                                            <CustomBottomNavigation/>
                                                                        </React.Fragment>
                                                                    </Route>
                                                                    <AccountChooser/>
                                                                    <RatingProvider>
                                                                        <RatingProvider>
                                                                            {tv ? <DesktopPlayer/> : <MobilePlayer/>}
                                                                            <MiniPlayer/>
                                                                        </RatingProvider>
                                                                    </RatingProvider>
                                                                    <Route exact path={["/home", "/"]}
                                                                           component={HomeComponent}/>
                                                                    <Route exact path={"/downloads"}
                                                                           component={Downloads}/>
                                                                    <SearchingProvider>
                                                                        {
                                                                            tv ? (
                                                                                <React.Fragment>
                                                                                    <Route exact path={"/search"}
                                                                                           component={SearchComponentTV}/>
                                                                                </React.Fragment>
                                                                            ) : (
                                                                                <React.Fragment>
                                                                                    <Route exact={true}
                                                                                           path={"/search"}
                                                                                           component={SearchResultComponent}/>
                                                                                    <Route exact path={"/suggest"}
                                                                                           component={SearchComponent}/>
                                                                                </React.Fragment>
                                                                            )
                                                                        }
                                                                    </SearchingProvider>
                                                                    <Route exact path={"/settings"}
                                                                           component={Settings}/>
                                                                    <Route exact path={"/discover"}
                                                                           component={Discover}/>
                                                                    <Route exact path={"/artist/:id"}
                                                                           component={ArtistComponent}/>
                                                                    <Route exact path={"/artists"}
                                                                           component={TrendingArtists}/>
                                                                </PlayProvider>
                                                            </PlayerProvider>
                                                        </LoadingProvider>
                                                    </SnackbarProvider>
                                                </DrawerComponent>
                                            </DrawerProvider>
                                        </BottomNavigationProvider>
                                    </AppRenderer>
                                </Route>
                            </AccountProvider>
                        </AccountChooserProvider>
                    </FocusRoot>
                </DialogProvider>
                <Route path={"/internal/error/:code/view"} component={ErrorComponent}/>
            </Router>
        </ThemeProvider>
    );
};

export default React.memo(App);
