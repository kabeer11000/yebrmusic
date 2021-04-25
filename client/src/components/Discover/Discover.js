import React from "react";
import "./Discover.css";
import SongCard2 from "../SongCard2/SongCard2.lazy";
import {Container, Divider, IconButton, ListItemSecondaryAction} from "@material-ui/core";
import makeStyles from "@material-ui/core/styles/makeStyles";
import Grid from "@material-ui/core/Grid";
import ListItemText from "@material-ui/core/ListItemText";
import {isTvContext, PlayContext} from "../../Contexts";
import PropTypes from "prop-types";
import SongCard from "../SongCard/SongCard";
import Preloader from "../Preloader/Preloader";
import {get, set} from "idb-keyval";
import {storageIndex} from "../../functions/Helper/StorageIndex";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import {Link} from "react-router-dom";
import {OpenInNew} from "@material-ui/icons";
import SessionRecommendation from "../../functions/SessionRecommendation";
import {useNetwork} from "../../Hooks";
import {FeedSection} from "../Home/home";
import {comLinkWorker as comlinkWorker} from "../../functions/Worker/worker-export";
import endPoints from "../../api/EndPoints/EndPoints";
import {initAuth} from "../../functions/Auth";

const useStyles = makeStyles((theme) => ({
    root: {
        flexGrow: 1,
    },
    paper: {
        padding: theme.spacing(2),
        textAlign: "center",
        color: theme.palette.text.secondary,
    },
}));
/***
 * User Uploaded Content One Way
 * Get User Video and upload it to your unlisted youtube playlist
 * When Recommending Get videos from that Playlist
 * Show Recently Uploaded mixed with Real Artists
 ***/
const Discover = (props) => {
    const classes = useStyles();
    const [state, setState] = React.useState(null);
    const [error, setError] = React.useState(false);
    const online = useNetwork();

    React.useEffect(() => {
        const a = async () => {
            try {
                // !await get(storageIndex.discover.saveObject) || !(Date.now() - await get(storageIndex.discover.timeObject)) / (100 * 60) > 1
                if (online) {
                    comlinkWorker.fetch(endPoints.API.RecentlyAdded, {
                        headers: ({Authorization: `Bearer ${await initAuth()}`}),
                    }).then(setLatest).catch();

                    const recommendations = await SessionRecommendation.getRecommendations();
                    setState({
                        ...recommendations,
                        items: props.embedded ? recommendations.items.slice(0, props.items || 15) : recommendations.items
                    });
                    await set(storageIndex.discover.timeObject, Date.now());
                    await set(storageIndex.discover.saveObject, recommendations);
                } else {
                    const homeObject = await get(storageIndex.discover.saveObject);
                    setState({
                        ...homeObject,
                        items: props.embedded ? homeObject.items.slice(0, props.items || 15) : homeObject.items
                    });
                }
            } catch (e) {
                setError(!error);
            }
        };
        a();
    }, []);
    // React.useEffect(() => {
    //     const a = async () => {
    //         if (!state) return;
    //         const saved = await get(storageIndex.discover.saveObject);
    //         if (!saved || saved.etag !== state.etag) {
    //             await set(storageIndex.discover.timeObject, Date.now());
    //             await set(storageIndex.discover.saveObject, state);
    //         }
    //     };
    //     a();
    // }, [state]);
    const tv = React.useContext(isTvContext);
    const {PlaySong} = React.useContext(PlayContext);
    const [latest, setLatest] = React.useState(null);


    return (
        <div className="Discover" style={{
            marginTop: props.embedded ? 0 : "5rem",
            marginBottom: props.embedded ? 0 : "3rem"
        }}>
            <div>
                {
                    props.embedded ? null : latest ? <FeedSection response={latest}/> : null
                }
            </div>
            <Divider hidden={props.embedded}/>
            <Container className={"mt-2"}>
                {
                    props.embedded ? null : <div>
                        <ListItemText primary={"Discover"} secondary={"Recommended for you"}/>
                        <br/>
                    </div>
                }

                <div className={classes.root}>
                    {
                        !tv ? <Grid container spacing={2}>
                            {
                                state ? state.items.map((video, i) => <Grid key={i} item xs={6} sm={2}>
                                    <SongCard2 onPlay={() => PlaySong({
                                        useProxy: true,
                                        song: video,
                                        playList: {
                                            list: state,
                                            index: i
                                        }
                                    })} video={video}/>
                                </Grid>) : !error ? <Preloader/> : null
                            }
                        </Grid> : <Grid container spacing={2}>
                            {
                                state ? state.items.map((video, i) => <div key={i} className={"mb-2"}><SongCard
                                    onClick={() => PlaySong({
                                        useProxy: true,
                                        song: video,
                                        playList: {
                                            list: state,
                                            index: i
                                        }
                                    })} song={video}/></div>) : !error ? <Preloader/> : null
                            }
                        </Grid>
                    }
                </div>
                {
                    props.embedded ? <List>
                        <ListItem selected={true} button component={Link} to={"/discover"}>
                            <ListItemText primary="Explore More" secondary={"Find More recommendations "}/>
                            <ListItemSecondaryAction>
                                <IconButton><OpenInNew/></IconButton>
                            </ListItemSecondaryAction>
                        </ListItem>
                    </List> : null

                }
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
            </Container>
        </div>
    );
};

Discover.propTypes = {
    embedded: PropTypes.bool,
    items: PropTypes.number
};

Discover.defaultProps = {};

export default React.memo(Discover);
