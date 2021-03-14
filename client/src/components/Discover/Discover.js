import React from "react";
import "./Discover.css";
import SongCard2 from "../SongCard2/SongCard2.lazy";
import {Container, IconButton, ListItemSecondaryAction} from "@material-ui/core";
import makeStyles from "@material-ui/core/styles/makeStyles";
import Grid from "@material-ui/core/Grid";
import ListItemText from "@material-ui/core/ListItemText";
import {isTvContext, PlayContext} from "../../Contexts";
import PropTypes from "prop-types";
import SongCard from "../SongCard/SongCard";
import Preloader from "../Preloader/Preloader";
import {get, set} from "idb-keyval";
import {storageIndex} from "../../functions/Helper/storageIndex";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import {Link} from "react-router-dom";
import {OpenInNew} from "@material-ui/icons";

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

    React.useEffect(() => {
        (async () => {
            try {
                if (!await get(storageIndex.discover.saveObject) || !(Date.now() - await get(storageIndex.discover.timeObject)) / (100 * 60) > 1) fetch("http://127.0.0.1:5000/feed/home/recom?for_each_history=2").then(a => a.json()).then(homeObject => {
                    setState({
                        ...homeObject,
                        items: props.embedded ? homeObject.items.slice(0, props.items || 15) : homeObject.items
                    });
                }).catch(() => setError(!error));
                else {
                    const homeObject = await get(storageIndex.discover.saveObject);
                    setState({
                        ...homeObject,
                        items: props.embedded ? homeObject.items.slice(0, props.items || 15) : homeObject.items
                    });
                }

                // fetch("http://localhost:9000/feed/_____test").then(a => a.json()).then(setState).catch(() => setError(!error));
                // fetch("http://localhost:5000/feed/home/recom?history_items=2&for_each_history=3").then(a => a.json()).then(setState).catch(() => setError(!error));
            } catch (e) {
                setError(!error);
            }
        })();
    }, []);
    React.useEffect(() => {
        (async () => {
            if (!state) return;
            const saved = await get(storageIndex.discover.saveObject);
            if (!saved || saved.etag !== state.etag) {
                await set(storageIndex.discover.timeObject, Date.now());
                await set(storageIndex.discover.saveObject, state);
            }
        })();
    }, [state]);
    const tv = React.useContext(isTvContext);
    const {PlaySong} = React.useContext(PlayContext);

    return (
        <div className="Discover" style={{
            marginTop: props.embedded ? 0 : "5rem",
            marginBottom: props.embedded ? 0 : "3rem"
        }}>
            <Container>
                {
                    props.embedded ? null : <React.Fragment>
                        <ListItemText primary={"Discover"} secondary={"Recommended for you"}/>
                        <br/>
                    </React.Fragment>
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
