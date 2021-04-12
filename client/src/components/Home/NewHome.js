import React, {useContext, useState} from 'react';
import InfiniteScroll from "react-infinite-scroll-component";
import CircularProgress from "@material-ui/core/CircularProgress";
import Container from "@material-ui/core/Container";
import Preloader from "../Preloader/Preloader";
import SongCard from "../SongCard/SongCard";
import {get, set} from "idb-keyval";
import {comLinkWorker as comlinkWorker} from "../../functions/Worker/worker-export";
import endPoints from "../../api/endpoints/endpoints";
import {initAuth} from "../../functions/auth";
import {DebugLog} from "../../functions/Log";
import {storageIndex} from "../../functions/Helper/storageIndex";
import Grow from "@material-ui/core/Grow";
import Typography from "@material-ui/core/Typography";
import Divider from "@material-ui/core/Divider";
import Discover from "../Discover/Discover";
import {isTvContext, PlayContext} from "../../Contexts";
import Chip from "@material-ui/core/Chip";
import {Link} from "react-router-dom";
import Avatar from "@material-ui/core/Avatar";
import {Done} from "@material-ui/icons";

const HomeComponent = () => {
    const getTopArtistFromAPI = async () => comlinkWorker.fetch(endPoints.getTopArtistFeed(), {
        headers: ({Authorization: `Bearer ${await initAuth()}`}),
    });
    const getSearchFeedFromAPI = async () => comlinkWorker.fetch(endPoints.getSearchFeed(), {
        headers: ({Authorization: `Bearer ${await initAuth()}`}),
    });


    const [state, setState] = useState([]);
    const tv = useContext(isTvContext);
    const [error] = React.useState(false);
    const loadable = ['Searched', 'TopArtist'];
    const Loader = async (component) => {
        try {
            switch (component) {
                case loadable[0]:
                    return getSearchFeedFromAPI();
                case loadable[1]:
                    return getTopArtistFromAPI();
                default:
                    return null
            }
        } catch (e) {
            DebugLog(e);
            return null
        }
    };
    const {PlaySong} = React.useContext(PlayContext);
    // const [showExplore, setExplore] = React.useState(false);
    const PushToState = async () => {
        if (state.length < loadable.length) {
            console.log(state.length, loadable[state.length]);
            if (navigator.onLine) {
                const update = await Loader(loadable[state.length]);
                if (update) setState(state => [...state, update]);
            } else {
                const update = (await get(storageIndex.home.saveObject))[state.length]
                if (update) setState(state => [...state, update]);
            }
        }
        // if (!showExplore && state.length === loadable.length) setExplore(!showExplore);
    };

    const SaveState = async () => {
        if (state && state.length) {
            await set(storageIndex.home.timeObject, Date.now());
            await set(storageIndex.home.saveObject, state);
        }
    };

    const [artists, setArtists] = React.useState({});
    React.useEffect(() => {
        // SaveState();
        console.log("Saved State")
    }, [state]);

    React.useEffect(() => {
        const a = async () => {
            comlinkWorker.fetch(endPoints.getFeedArtists, {
                headers: {Authorization: `Bearer ${await initAuth()}`},
            }).then(setArtists);
            if (!await get(storageIndex.home.saveObject) || !(Date.now() - await get(storageIndex.home.timeObject)) / (100 * 60) > 1) await PushToState();
            else {
                const homeObject = await get(storageIndex.home.saveObject);
                setState(homeObject);
            }
        };
        a();
    }, []);

    return (
        <React.Fragment>
            <div className="home mb-5" style={{minHeight: "70vh"}}>
                <div style={{marginTop: tv ? "1rem" : "5rem"}}>
                    {artists && artists.items ?
                        <div className={`cardSlider text-left Slider d-block`}>
                            {artists.items.map((artist, index) =>
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
                    <InfiniteScroll
                        dataLength={loadable.length}
                        next={PushToState}
                        hasMore={state && state.length !== loadable.length}
                        loader={<div className={"text-center"}><CircularProgress/></div>}
                        endMessage={<></>}>
                        <div>
                            {!error ?
                                <React.Fragment>
                                    <React.Fragment>
                                        <Grow in={true}>
                                            <Typography variant={"h5"}
                                                        className={"mb-3 mt-2 pl-3 text-left text-truncate"}>
                                                Explore
                                            </Typography>
                                        </Grow>
                                        <Discover embedded={true} items={4}/>
                                    </React.Fragment>
                                </React.Fragment> : null
                            }
                        </div>
                        <Divider className={"my-3"}/>
                        <div>
                            {state ? <React.Fragment>
                                {state.map((response, index) =>
                                    <React.Fragment key={index}>
                                        {response.items ?
                                            <React.Fragment key={index}>
                                                <Grow in={true}>
                                                    <Typography variant={"h5"}
                                                                className={"pl-3 text-left text-truncate"}>
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
                        </div>
                    </InfiniteScroll>
                    <div>
                        {error ? <div className="Preloader text-center" style={{
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

                        </div> : null}
                    </div>
                </div>
            </div>
        </React.Fragment>
    );
}
export default React.memo(HomeComponent);
