import React, {useContext} from "react";
import "./home.css";
import endPoints from "../../api/EndPoints/EndPoints";
import SongCard from "../SongCard/SongCard.lazy";
import {initAuth} from "../../functions/Auth";
import Container from "@material-ui/core/Container";
import Typography from "@material-ui/core/Typography";
import Preloader from "../Preloader/Preloader";
import Grow from "@material-ui/core/Grow";
import {storageIndex} from "../../functions/Helper/StorageIndex";
import Avatar from "@material-ui/core/Avatar";
import Chip from "@material-ui/core/Chip";
import {Done} from "@material-ui/icons";
import {Link} from "react-router-dom";
import {isTvContext, PlayContext} from "../../Contexts";
import {get, set} from "idb-keyval";
import {comLinkWorker as comlinkWorker} from "../../functions/Worker/worker-export";
import Divider from "@material-ui/core/Divider";
import Discover from "../Discover/Discover";

const HomeComponent = () => {
    const tv = useContext(isTvContext);
    const [error, setError] = React.useState(false);
    const [etag, setEtag] = React.useState(null);
    const [state, setState] = React.useState([]);
    const [artists, setArtists] = React.useState({});

    const getPlaylistFromAPI = async (e, t) => await comlinkWorker.fetch(endPoints.getPlayListById(e), {
        headers: ({Authorization: `Bearer ${t}`}),
        // signal: abortController.signal
    });
    const getTopArtistFromAPI = (e) => comlinkWorker.fetch(endPoints.getTopArtistFeed(), {
        headers: ({Authorization: `Bearer ${e}`}),
        // signal: abortController.signal
    });
    const getSearchFeedFromAPI = (e) => comlinkWorker.fetch(endPoints.getSearchFeed(), {
        headers: ({Authorization: `Bearer ${e}`}),
        // signal: abortController.signal
    });

    const LoadData = async (token) => {
        if (!token) console.log("No Token");
        // const error = () => new Error("Not Found");

        // getPlaylistFromAPI(playlistsIds.TopBolloywood, token).then(o => o.ok ? o.json() : error()).then(o => setSongObj(t => ({
        // 	...t,
        // 	[makeid(10)]: o
        // }))).catch(o => (o));
        // getPlaylistFromAPI(playlistsIds.LatestSongs, token).then(o => o.ok ? o.json() : error()).then(o => setSongObj(t => ({
        // 	...t,
        // 	[makeid(10)]: o
        // }))).catch(o => (o));
        // getPlaylistFromAPI(playlistsIds.TopPop, token).then(o => o.ok ? o.json() : error()).then(o => setSongObj(t => ({
        // 	...t,
        // 	[makeid(10)]: o
        // }))).catch(o => (o));
        // getPlaylistFromAPI(playlistsIds.RomanticSongs, token).then(o => o.ok ? o.json() : error()).then(o => setSongObj(e => ({
        // 	...e,
        // 	[makeid(10)]: o
        // }))).catch(o => (o));
        // getPlaylistFromAPI(playlistsIds.EdmSongs, token).then(o => o.ok ? o.json() : error()).then(o => setSongObj(e => ({
        // 	...e,
        // 	[makeid(10)]: o
        // }))).catch(o => (o));
        // getPlaylistFromAPI(playlistsIds.Reggaeton, token).then(o => o.ok ? o.json() : error()).then(o => setSongObj(e => ({
        // 	...e,
        // 	[makeid(10)]: o
        // }))).catch(o => (o));
        getTopArtistFromAPI(token).then(o => o ? o : null).then(o => setState(d => [
            ...d,
            o
        ])).catch(o => (o));
        getSearchFeedFromAPI(token).then(o => o ? o : null).then(o => setState(d => [
            ...d,
            o
        ])).catch(o => (o));

        // return Object.keys(songObj).length ? await set(storageIndex.home.timeObject, JSON.stringify(Date.now())) : null;
    };
    const {PlaySong} = React.useContext(PlayContext);
    const init = async () => {
        try {
            const token = await initAuth();
            if (!await get(storageIndex.home.saveObject) || !(Date.now() - await get(storageIndex.home.timeObject)) / (100 * 60) > 1) await LoadData(token);
            else {
                const homeObject = await get(storageIndex.home.saveObject);
                setState(homeObject);
            }
            await comlinkWorker.fetch(endPoints.getFeedArtists, {
                headers: {Authorization: `Bearer ${token}`},
            }).then(setArtists);
        } catch (e) {
            setError(true);
        }
    };

    React.useEffect(() => {
        if (navigator.onLine) init();
    }, []);

    const LoadState = async () => {
        if (state) {
            const saved = await get(storageIndex.home.saveObject);
            if (!saved) {
                await set(storageIndex.home.timeObject, Date.now());
                await set(storageIndex.home.saveObject, state);
            }
        }
    };
    React.useEffect(() => {
        LoadState();
    }, [state]);

    return (
        <div className="home mb-5" style={{minHeight: "70vh"}}>
            <div style={{marginTop: tv ? "1rem" : "5rem"}}>
                {artists && artists.items ?
                    <div className={`cardSlider text-left Slider d-block`}>
                        {artists.items.map((artist, index) =>
                            <Grow in={true} key={index}>
                                <Chip
                                    component={Link}
                                    to={"/artist/" + artist.id}
                                    avatar={<Avatar>{artist.name.charAt(0)}</Avatar>}
                                    label={artist.name}
                                    clickable
                                    className={"mx-1"}
                                    deleteIcon={<Done/>}
                                />
                            </Grow>)
                        }
                    </div> : null}
                {state ? <React.Fragment>
                    {state.map((response, index) =>
                        <React.Fragment key={index}>
                            {response.items ?
                                <React.Fragment key={index}>
                                    <Grow in={true}>
                                        <Typography variant={"h5"} className={"pl-3 text-left text-truncate"}>
                                            {response.title}
                                        </Typography>
                                    </Grow>
                                    <Container maxWidth="xl" className={"px-0 mx-0 mb-0 pb-0"}>
                                        <div className={"cardSlider Slider"}>
                                            {response.items.map((video, index) => <SongCard key={index}
                                                                                            song={video}
                                                                                            onClick={() => PlaySong({
                                                                                                useProxy: true,
                                                                                                song: video,
                                                                                                playList: {
                                                                                                    list: response,
                                                                                                    index: index
                                                                                                }
                                                                                            })}/>
                                            )}
                                        </div>
                                    </Container>
                                </React.Fragment> : null}
                        </React.Fragment>
                    )}
                </React.Fragment> : !error ? <Preloader/> : null}
                {!error ?
                    <React.Fragment>
                        <Divider/>
                        <React.Fragment>
                            <Grow in={true}>
                                <Typography variant={"h5"} className={"mb-3 mt-2 pl-3 text-left text-truncate"}>
                                    Explore
                                </Typography>
                            </Grow>
                            <Discover embedded={true} items={4}/>
                        </React.Fragment>
                    </React.Fragment> : null
                }
            </div>
            {error ? <div className="Preloader text-center" style={{
                width: "10rem",
                height: "10rem",
                position: "absolute",
                top: "50%",
                left: "50%",
                transform: "translate(-50%, -50%)"
            }}>
                <img src={"./assets/icons/darkmode_nothingfound.svg"} style={{width: "8rem", height: "auto"}}
                     alt={"Kabeers Music Logo"}/>

            </div> : null}

        </div>
    );
};

HomeComponent.propTypes = {};
HomeComponent.defaultProps = {};
export default React.memo(HomeComponent);
