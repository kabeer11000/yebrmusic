import React from "react";
import "./App.css";
import HomeComponent from "./components/Home/home.lazy";
import {BrowserRouter as Router, Route} from "react-router-dom";
import CustomBottomNavigation from "./components/CustomBottomNavigation/CustomBottomNavigation.lazy";
import Downloads from "./components/Downloads/Downloads.lazy";
import MobilePlayer from "./components/Player/Moblie/Player.lazy";
import DesktopPlayer from "./components/Player/Desktop/Player.lazy";
import MiniPlayer from "./components/Player/MiniPlayer/MiniPlayer.lazy";
import CustomAppBar from "./components/CustomAppBar/CustomAppBar.lazy";
import SearchComponent from "./components/SearchComponent/SearchComponent.lazy";
import DrawerComponent from "./components/Drawer/Drawer.lazy";
import Button from "@material-ui/core/Button";
import SearchResultComponent from "./components/SearchComponent/SearchResultComponent.lazy";
import CssBaseline from "@material-ui/core/CssBaseline";
import Settings from "./components/Settings/Settings.lazy";
import Liked from "./components/Liked/Liked.lazy";
import "bootstrap/dist/css/bootstrap.min.css";
import {DialogProvider} from "muibox";
import ArtistComponent from "./components/ArtistComponent/ArtistComponent.lazy";
import {FocusRoot} from "@please/lrud";
import Strings from "./Strings";
import SearchComponentTV from "./components/SearchComponentTV/SearchComponentTV.lazy";
import AlertTitle from "@material-ui/lab/AlertTitle";
import Alert from "@material-ui/lab/Alert";
import {
    AccountChooserProvider,
    AccountContext,
    AccountProvider,
    BottomNavigationProvider,
    DrawerProvider,
    isTvContext,
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
import {ErrorComponent} from "./InternalViews/ErrorViewer";
import AccountChooser from "./components/AccountChooser/AccountChooser.lazy";
import Preloader from "./components/Preloader/Preloader";
import Grid from "@material-ui/core/Grid";
// import CastDialog from "./components/CastingDialog/CastingDialog";

const AppRenderer = ({children}) => {
    const {token} = React.useContext(AccountContext);
    return token && !(token instanceof Error) ? (
        <app-container>{children}</app-container>) : !token && !(token instanceof Error) ?
        (token instanceof OfflineToken) ? <app-container>{children}</app-container> : <Preloader/> : (
            <app-container>
                <Alert severity="error" style={{
                    height: "100vh",
                    paddingTop: "2rem"
                }}>
                    <React.Fragment>
                        <Grid container spacing={2}>
                            <Grid item xl={12}>
                                <AlertTitle>{Strings["Utils:App:Net.NoConnection:Failed.Title"]}</AlertTitle>
                                {Strings["Utils:App:Net.NoConnection:Failed.Body[1]"]}
                            </Grid>
                            <Grid item xl={6}>
                                <Button style={{
                                    marginTop: "2rem",
                                    width: "100%"
                                }} color="inherit"
                                        onClick={() => window.location.href = Strings["SupportEmail"]}>{Strings["Utils:App:Support"]}</Button>
                            </Grid>
                            <Grid item xl={6}>
                                <Button variant={"outlined"} style={{
                                    marginTop: "1rem",
                                    width: "100%"
                                }} color="inherit"
                                        onClick={() => window.location.reload()}>{Strings["Utils:App:Retry.Text"]}</Button>
                            </Grid>
                        </Grid>
                    </React.Fragment>
                </Alert>
            </app-container>
        );
};
const App = () => {
    const tv = React.useContext(isTvContext);
    return (
        <ThemeProvider>
            <Router>
                <DialogProvider>
                    <CssBaseline/>
                    <FocusRoot className="App">
                        <AccountChooserProvider>
                            {/*<React.Suspense fallback={<div className="spinner"><Preloader/></div>}>*/}
                            <AccountProvider>
                                <Route>
                                    <AppRenderer>
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
                                                                            <AccountChooser/>
                                                                            <CustomBottomNavigation/>
                                                                            {/*<BackDropLoader hidden={backdrop}/>*/}
                                                                        </React.Fragment>
                                                                    </Route>
                                                                    {/*<RatingProvider>*/}
                                                                    {/*<CastProvider>*/}
                                                                    {/*    <CastDialogProvider>*/}
                                                                    <RatingProvider>
                                                                        {tv ? <DesktopPlayer/> :
                                                                            <MobilePlayer/>}
                                                                        <MiniPlayer/>
                                                                        {/*<CastDialog/>*/}
                                                                    </RatingProvider>
                                                                    {/*</CastDialogProvider>*/}
                                                                    {/*</CastProvider>*/}
                                                                    {/*</RatingProvider>*/}
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
                                                                                           path={"/search/results"}
                                                                                           component={SearchResultComponent}/>
                                                                                    <Route exact path={"/search"}
                                                                                           component={SearchComponent}/>
                                                                                </React.Fragment>
                                                                            )
                                                                        }
                                                                    </SearchingProvider>
                                                                    <Route exact path={"/liked"} component={Liked}/>
                                                                    <Route exact path={"/settings"}
                                                                           component={Settings}/>
                                                                    <Route exact path={"/discover"}
                                                                           component={Discover}/>
                                                                    {/*<Route exact path={"/history"} component={HistoryComponent}/>*/}
                                                                    {/*<Route exact path={"/charts"} component={PlayLists}/>*/}
                                                                    <Route exact path={"/artist/:id"}
                                                                           component={ArtistComponent}/>
                                                                    {/*<Route exact path={"/TestArtistComponent"}*/}
                                                                    {/*       component={TestArtistComponent}/>*/}
                                                                    {/*Trending*/}
                                                                    <Route exact path={"/artists"}
                                                                           component={TrendingArtists}/>
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
                                    </AppRenderer>
                                </Route>
                            </AccountProvider>
                            {/*</React.Suspense>*/}
                        </AccountChooserProvider>
                    </FocusRoot>
                </DialogProvider>
                <Route path={"/internal/error/:code/view"} component={ErrorComponent}/>
            </Router>
        </ThemeProvider>
    );
};

export default React.memo(App);
