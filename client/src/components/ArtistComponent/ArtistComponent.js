import React, {useContext, useEffect, useState} from "react";
import Container from "@material-ui/core/Container";
import "./ArtistComponent.css"
import {isTvContext, PlayContext} from "../../Contexts";
import Typography from "@material-ui/core/Typography";
import CardActionArea from "@material-ui/core/CardActionArea";
import {AppBar, IconButton, Toolbar} from "@material-ui/core";
import {ArrowBack, PlayArrow, PlayArrowOutlined} from "@material-ui/icons";
import ListItemText from "@material-ui/core/ListItemText";
import Divider from "@material-ui/core/Divider";
import Preloader from "../Preloader/Preloader";
import SongCard from "../SongCard/SongCard";
import Grid from "@material-ui/core/Grid";
import SongCard2 from "../SongCard2/SongCard2";
import InfiniteScroll from "react-infinite-scroll-component";
import CircularProgress from "@material-ui/core/CircularProgress";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemSecondaryAction from "@material-ui/core/ListItemSecondaryAction";
import Card from "@material-ui/core/Card";
import useScrollTrigger from "@material-ui/core/useScrollTrigger";
import Slide from "@material-ui/core/Slide";
import {initAuth} from "../../functions/auth";
import {useSnackbar} from "notistack";
import {get, set} from "idb-keyval";
import {storageIndex} from "../../functions/Helper/storageIndex";
import {withRouter} from "react-router-dom";
import endPoints from "../../api/endpoints/endpoints";
import {comLinkWorker} from "../../functions/Worker/worker-export";

const ArtistComponent = ({history}) => {
    const [state, setState] = useState(null);
    const [loaded, setLoaded] = useState(null);
    const [loadedLength, setLoadedLength] = useState(8);
    const {enqueueSnackbar} = useSnackbar();
    const trigger = useScrollTrigger({
        threshold: 150
    });

    const [error, setError] = React.useState(false);
    useEffect(() => {
        const LoadArtist = async () => {
            try {
                const id = new URLSearchParams(window.location.search).get("id")
                const saved = await get(storageIndex.artists.saveObject(id));
                if (!saved || saved.etag !== state.etag) {
                    const token = await initAuth();
                    const response = await comLinkWorker.fetch(endPoints.getArtistInfo(new URLSearchParams(window.location.search).get("id")), {
                        headers: {Authorization: `Bearer ${token}`},
                    })
                    setState(response);
                    setLoaded(response.items.slice(0, loadedLength));
                    setLoadedLength(loadedLength + 4);
                } else {
                    setState(saved);
                    setLoaded(saved.items.slice(0, loadedLength));
                    setLoadedLength(loadedLength + 4);
                }
            } catch (e) {
                console.log(e);
                enqueueSnackbar("Failed to Load Artist");
                setError(true);
            }
        }
        LoadArtist();
    }, []);
    useEffect(() => {
        const SaveArtist = async () => {
            if (!state) return;
            const saved = await get(storageIndex.artists.saveObject(state.id));
            if (!saved || saved.etag !== state.etag) await set(storageIndex.artists.saveObject(state.id), state);
        }
        SaveArtist();
    }, [state])
    const LoadMore = async () => {
        if (state && state.items) {
            setLoaded(state.items.slice(0, loadedLength));
            setLoadedLength(loadedLength + 4);
        }
    };
    const tv = useContext(isTvContext);
    const {PlaySong} = React.useContext(PlayContext);
    return <div>
        {state ? <React.Fragment>
            <Card><CardActionArea>
                <img src={state.author.bestAvatar.url} style={{
                    height: "15rem",
                    // position: "fixed",
                    top: 0,
                    left: 0,
                    width: "100%",
                    objectFit: "cover",
                    filter: "blur(2px)",
                }} alt={state.author.name}/>
                <div style={{
                    position: 'absolute',
                    backgroundColor: "#000000",
                    opacity: "30%",
                    height: "100%",
                    width: "100%",
                    top: 0
                }}/>

                <Slide in={trigger} direction={"bottom"}>
                    <AppBar position="fixed" style={{zIndex: "5", paddingLeft: tv ? "4.5rem" : 0}}>
                        <Toolbar>
                            <IconButton onClick={() => history.goBack()} edge="start" aria-label="close">
                                <ArrowBack/>
                            </IconButton>
                            <Typography variant="h6" style={{
                                // color: "#FFF"
                            }}>
                                {state.author.name}
                            </Typography>
                            <div style={{flex: "1 1 auto"}}/>
                            <IconButton onClick={() => PlaySong({
                                useProxy: true,
                                song: state.items[0],
                                playList: {
                                    list: state,
                                    index: 0
                                }
                            })}>
                                <PlayArrowOutlined/>
                            </IconButton>
                        </Toolbar>
                    </AppBar>
                </Slide>
                <AppBar hidden={trigger} color={"transparent"} position={"absolute"} style={{
                    top: 0,
                    left: 0
                }} elevation={0}>
                    <Toolbar color={"#BBBBBB"} style={{color: "#BBBBBB"}}>
                        <IconButton onClick={() => history.goBack()} edge="start" aria-label="close">
                            <ArrowBack/>
                        </IconButton>
                        <div style={{flex: "1 1 auto"}}/>
                    </Toolbar>
                </AppBar>

                <Container>
                    <Typography style={{
                        position: "absolute",
                        bottom: "0.5rem",
                        width: "100%",
                        color: "#FFF"
                    }} variant={"h3"} className={"text-truncate"}>{state.author.name}</Typography>
                </Container>
            </CardActionArea>
            </Card>
            <List>
                <ListItem>
                    <ListItemText primary={state.lastUpdated}
                                  secondary={`${state.views} listeners,  ${state.estimatedItemCount} audios`}/>
                    <ListItemSecondaryAction>
                        <IconButton style={{
                            width: "10vh",
                            height: "10vh",
                            backgroundColor: "#E14A58",
                            marginBottom: "-13.0vh"
                        }} onClick={() => PlaySong({
                            useProxy: true,
                            song: state.items[0],
                            playList: {
                                list: state,
                                index: 0
                            }
                        })}>
                            <PlayArrow/>
                        </IconButton>
                    </ListItemSecondaryAction>
                </ListItem>
                <Divider/>
                <ListItem>
                    <ListItemText primary={"Popular"} secondary={`${state.title}`}/>
                </ListItem>
            </List>
            <React.Fragment>
                <InfiniteScroll
                    dataLength={loadedLength}
                    next={LoadMore}
                    hasMore={state && loaded ? loaded.length !== state.items.length : false}
                    // hasMore={state && state.length ? loadedLength !== state.length : false}
                    loader={<div className={"text-center"}><CircularProgress/></div>}
                    endMessage={<></>}>
                    <Container>
                        {
                            !tv ? <Grid container spacing={2}>
                                {
                                    loaded ? loaded.map((video, index) => <Grid key={index} item xs={6}
                                                                                sm={2}>
                                        <SongCard2 onPlay={() => PlaySong({
                                            useProxy: true,
                                            song: video,
                                            playList: {
                                                list: state,
                                                index: index
                                            }
                                        })} video={video}/>
                                    </Grid>) : !error ? <Preloader/> : null
                                }
                            </Grid> : <Grid container spacing={2}>
                                {
                                    loaded ? loaded.map((video, index) => <div key={index}
                                                                               className={"mb-2"}>
                                        <SongCard onClick={() => PlaySong({
                                            useProxy: true,
                                            song: video,
                                            playList: {
                                                list: state,
                                                index: index
                                            }
                                        })} song={video}/>
                                    </div>) : !error ? <Preloader/> : null
                                }
                            </Grid>
                        }
                    </Container>
                </InfiniteScroll>
            </React.Fragment>
        </React.Fragment> : !error ? <Preloader/> : null}
    </div>
};
export default React.memo(withRouter(ArtistComponent))
