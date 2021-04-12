import React from "react";
import {isTvContext, PlayContext} from "../../Contexts";
import {comLinkWorker as comlinkWorker} from "../../functions/Worker/worker-export";
import endPoints from "../../api/endpoints/endpoints";
import {initAuth} from "../../functions/auth";
import Grow from "@material-ui/core/Grow";
import Chip from "@material-ui/core/Chip";
import {Link} from "react-router-dom";
import Avatar from "@material-ui/core/Avatar";
import {Done} from "@material-ui/icons";
import Typography from "@material-ui/core/Typography";
import Container from "@material-ui/core/Container";
import SongCard from "../SongCard/SongCard";
import Preloader from "../Preloader/Preloader";
import {get, set} from "idb-keyval";
import {storageIndex} from "../../functions/Helper/storageIndex";
import Divider from "@material-ui/core/Divider";
import Discover from "../Discover/Discover";
import Paper from "@material-ui/core/Paper";


const ArtistsSlider = () => {
    const [state, setState] = React.useState(null);
    const loadArtists = async () => comlinkWorker.fetch(endPoints.getFeedArtists, {
        headers: {Authorization: `Bearer ${await initAuth()}`},
    }).then(setState);
    React.useEffect(() => {
        loadArtists();
    }, []);
    return (
        <Paper variant={"outlined"} className={"mb-3"} hidden={!state}>
            {state && state.items ?
                <div className={`cardSlider text-left Slider d-block py-2`} style={{
                    backgroundColor: "transparent",
                    borderLeft: 0,
                    borderRadius: 0,
                    borderRight: 0
                }}>
                    {state.items.map((artist, index) =>
                        <Grow in={true} key={index}>
                            <Chip
                                component={Link}
                                to={"/artist?id=" + artist.id}
                                avatar={<Avatar>{artist.name.charAt(0)}</Avatar>}
                                label={artist.name}
                                clickable
                                className={"mx-1"}
                                deleteIcon={<Done/>}
                            />
                        </Grow>)
                    }
                </div> : null}
        </Paper>
    )
}
const FeedSection = ({response}) => {
    const {PlaySong} = React.useContext(PlayContext);
    return (
        <React.Fragment>
            {response.items ?
                <React.Fragment>
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
    );
};
const ErrorComponent = (error) => (
    <div hidden={error} className="Preloader text-center" style={{
        width: "10rem",
        height: "10rem",
        position: "absolute",
        top: "50%",
        left: "50%",
        transform: "translate(-50%, -50%)"
    }}>
        <img src={"./assets/icons/darkmode_nothingfound.svg"}
             style={{width: "8rem", height: "auto"}}
             alt={"Kabeers Music Logo"}/>

    </div>
);
const getTopArtistFromAPI = (e) => comlinkWorker.fetch(endPoints.getTopArtistFeed(), {
    headers: ({Authorization: `Bearer ${e}`})
});
const getSearchFeedFromAPI = (e) => comlinkWorker.fetch(endPoints.getSearchFeed(), {
    headers: ({Authorization: `Bearer ${e}`})
});

const HomeComponent = () => {
    const tv = React.useContext(isTvContext);
    const [state, setState] = React.useState([]);
    const [error, setError] = React.useState(false);

    const loadSections = async () => {
        try {
            const token = await initAuth();
            getTopArtistFromAPI(token).then(response => setState(state => [...state, response]));
            getSearchFeedFromAPI(token).then(response => setState(state => [...state, response]));
        } catch (e) {
            setError(!error);
            console.log(e);
        }
    }
    const init = async () => {
        if (!await get(storageIndex.home.saveObject)) return await loadSections();
        if (!(Date.now() - await get(storageIndex.home.timeObject)) / (100 * 60) > 1) {
            return await loadSections(); // Load From Server
        } else {
            const homeObject = await get(storageIndex.home.saveObject);
            return setState(homeObject); // SetState From IndexedDB
        }
    }

    const saveState = async () => {
        if (state && state.length) {
            await set(storageIndex.home.timeObject, Date.now());
            await set(storageIndex.home.saveObject, state);
        }
    };
    React.useEffect(() => {
        saveState();
    }, [state]);
    React.useEffect(() => {
        init();
    }, []);

    return (
        <div className="home mb-5" style={{minHeight: "70vh"}}>
            <div style={{marginTop: tv ? "1rem" : "5rem"}}>
                <ArtistsSlider/>
            </div>

            {(state && state.length) ? (
                state.map((response, index) => <FeedSection key={index} response={response}/>)
            ) : !error ? <Preloader/> : null}

            <div className={"mb-3"}>
                {!error ?
                    <React.Fragment>
                        <Divider/>
                        <React.Fragment>
                            <Grow in={true}>
                                <Typography variant={"h5"} className={"mb-3 mt-2 pl-3 text-left text-truncate"}>
                                    Explore
                                </Typography>
                            </Grow>
                            <Discover embedded={true} items={8}/>
                        </React.Fragment>
                    </React.Fragment> : null
                }
            </div>

            <ErrorComponent error={error}/>
        </div>
    )
}
export default React.memo(HomeComponent);
