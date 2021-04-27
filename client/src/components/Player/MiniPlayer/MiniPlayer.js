import {AppBar, IconButton, Typography} from "@material-ui/core";
import {Close, OpenInNew, Pause, PlayCircleOutline} from "@material-ui/icons";
import React from "react";
import CustomMiniPlayerSlider from "../CustomMiniPlayerSlider";
import Card from "@material-ui/core/Card";
import {FocusNode} from "@please/lrud";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardMedia from "@material-ui/core/CardMedia";
import CardContent from "@material-ui/core/CardContent";
import Link from "@material-ui/core/Link";
import {isTvContext, PlayContext, PlayerContext} from "../../../Contexts";
import Slide from "@material-ui/core/Slide";
import ListItemText from "@material-ui/core/ListItemText";
import ListItem from "@material-ui/core/ListItem";
import ListItemSecondaryAction from "@material-ui/core/ListItemSecondaryAction";
import List from "@material-ui/core/List";
import {withRouter} from "react-router-dom";

const styles = {
    TVPlayButton: {
        position: "absolute",
        top: "35%",
        left: "50%",
        transform: "translate(-50%, -50%)"
    }
};
const MiniPlayer = ({history}) => {
    const {playState, setPlayState} = React.useContext(PlayContext);
    const [playerState, setPlayerState] = React.useContext(PlayerContext);
    if (!playerState.MiniPlayer) return null;

    const tv = React.useContext(isTvContext);
    const cutCurrentSongState = async () => {
        playState.audioElement.pause();
        playState.audioElement.src = "#";
        setPlayerState({
            Dialog: false,
            MiniPlayer: false
        });
        setPlayState({
            ...playState,
            playList: null,
            videoElement: null,
        });
        document.title = "Yebr Music";
        // if (localStorage.getItem(storageIndex.currentlyCasting)) await sendPauseCast(localStorage.getItem(storageIndex.castingTo));
    };
    const Song = playState.others.offline ? playState.videoElement.videoElement : playState.videoElement;
    const [playing, setPlaying] = React.useState(playState.audioElement.paused);

    const pauseAudio = () => {
        playState.audioElement.pause();
        setPlaying(true);
    };
    const playAudio = () => {
        playState.audioElement.play();
        setPlaying(false);
    };
    const ReOpenDialog = () => setPlayerState({
        Dialog: true,
        MiniPlayer: false
    });
    const bottomNav = !['/settings', '/artist'].includes(history.location.pathname);

    return tv ?
        <Slide in={playerState.MiniPlayer} direction={"top"}>
            <AppBar
                color={"slideDown primary.miniPlayer.main"} style={{
                position: "fixed",
                top: "auto",
                bottom: "0",
                maxWidth: "25rem",
                maxHeight: "17rem",
            }} component={"div"} elevation={1} className={"d-inline-flex KabeersMiniPlayerContainer"}>
                <Card className={"SongCard"} style={{width: "100%", height: "100%", borderRadius: 0}}
                      variant={"elevation"}
                      elevation={3}>
                    <FocusNode>
                        <CardActionArea disableRipple>
                            <React.Fragment>
                                <IconButton style={{position: "absolute", right: "0.25rem", top: "0.25rem"}}
                                            onClick={cutCurrentSongState}><Close/></IconButton>
                                {
                                    playing ?
                                        <IconButton style={{...styles.TVPlayButton}}
                                                    onClick={playAudio}><PlayCircleOutline
                                            color={"#fff"}/></IconButton> :
                                        <IconButton style={{...styles.TVPlayButton}} onClick={pauseAudio}>
                                            <Pause color={"#fff"}/></IconButton>
                                }
                                <CardMedia
                                    className={"-rounded-circle"}
                                    component={"img"}
                                    alt={Song.snippet.title}
                                    image={Song.snippet.thumbnails.high.url}
                                    title={Song.snippet.title}
                                    loading={"lazy"}
                                    style={{height: "11rem", width: "100%"}}
                                />
                                <div style={{width: "100%", position: "absolute", marginTop: "-0.56rem"}}>
                                    <CustomMiniPlayerSlider/>
                                </div>
                            </React.Fragment>
                            <CardContent onClick={ReOpenDialog} className={"text-left"}>
                                <List className={"p-0 m-0"}>
                                    <ListItem className={"p-0 m-0"}>
                                        <ListItemText className={"p-0 m-0 text-truncate  w-100"}
                                                      primary={<Typography gutterBottom variant="h6" component="p"
                                                                           className={"text-truncate"}>
                                                          {Song.snippet.title}</Typography>} secondary={
                                            <Typography variant="body2" color="textSecondary"
                                                        style={{textDecoration: "none"}}
                                                        component={Link}
                                                        to={`/artist/${Song.snippet.channelId}`}
                                                        className={"text-truncate"}>
                                                {/*{playState.videoElement.snippet.channelTitle}*/}
                                                {/*{playState.videoElement.snippet.description ? playState.videoElement.snippet.description.slice(0, 70) + " ..." : ""}*/}
                                                <span className={"text-muted"}>
											{Song.snippet.channelTitle}
										</span>
                                            </Typography>}/>
                                        <ListItemSecondaryAction hidden>
                                            <IconButton>
                                                <OpenInNew/>
                                            </IconButton>
                                        </ListItemSecondaryAction>
                                    </ListItem>
                                </List>
                            </CardContent>
                        </CardActionArea>
                    </FocusNode>
                </Card>
            </AppBar>
        </Slide>
        :
        <Slide in={playerState.MiniPlayer} direction={"bottom"}>
            <AppBar
                color={"slideDown primary.miniPlayer.main"} style={{
                position: "fixed",
                top: "auto",
                bottom: bottomNav ? "3.5rem" : 0,
                width: "100%",
            }} component={"div"} elevation={1} className={"d-inline-flex KabeersMiniPlayerContainer"}>
                <div className={"d-inline-flex"}>
                    <div onClick={ReOpenDialog} className={"d-inline-flex"}>
                        <img
                            onError={(e) => {
                                e.target.onerror = null;
                                e.target.src = "https://cdn.jsdelivr.net/gh/kabeer11000/docs-hosted@yebrmusic-assets/broken_image_black_24dp.svg";
                            }}
                            src={Song.snippet.thumbnails.high.url} style={{
                            width: "4rem",
                            height: "3rem",
                            maxWidth: "6rem!important",
                            maxHeight: "4rem!important"
                        }}
                            alt={Song.snippet.title} className={"KabeersMiniPlayerImage"}
                            loading={"lazy"}/>
                        <Typography component={"span"} className={"text-truncate p-2 KabeersMiniPlayerText"} style={{
                            width: "10em",
                            color: "primary.miniPlayer.text"
                        }}>
                            {Song.snippet.title || "Untitled"}
                        </Typography>
                    </div>
                    <div className={"float-right ml-auto"}>
                        {
                            playing ? <IconButton onClick={playAudio}><PlayCircleOutline
                                    color={"#fff"}/></IconButton> :
                                <IconButton onClick={pauseAudio}><Pause color={"#fff"}/></IconButton>
                        }
                        <IconButton onClick={cutCurrentSongState}><Close/></IconButton>
                    </div>
                </div>
                <CustomMiniPlayerSlider/>
            </AppBar>
        </Slide>;
};

export default React.memo(withRouter(MiniPlayer));
