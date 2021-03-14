import {AppBar, IconButton, Typography} from "@material-ui/core";
import {Close, Pause, PlayCircleOutline} from "@material-ui/icons";
import React from "react";
import CustomMiniPlayerSlider from "./CustomMiniPlayerSlider";
// import {sendPauseCast} from "../../functions/Cast/Cast";
import Card from "@material-ui/core/Card";
import {FocusNode} from "@please/lrud";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardMedia from "@material-ui/core/CardMedia";
import CardContent from "@material-ui/core/CardContent";
import Link from "@material-ui/core/Link";
import {BottomNavigationContext, isTvContext, PlayContext, PlayerContext} from "../../Contexts";
import addMediaSession from "../../functions/Helper/addMediaSession";
import Slide from "@material-ui/core/Slide";

const styles = {
    TVPlayButton: {
        position: "absolute",
        top: "35%",
        left: "50%",
        transform: "translate(-50%, -50%)"
    }
};
const MiniPlayer = () => {
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
        // if (localStorage.getItem(storageIndex.currentlyCasting)) await sendPauseCast(localStorage.getItem(storageIndex.castingTo));
    };
    const bottomNav = React.useContext(BottomNavigationContext)[0];
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
    React.useEffect(() => {
        // if (playState.audioElement.paused) playState.audioElement.play();
        console.log("Playing:", playState.videoElement.snippet.title);
        // saveToHistory({
        // 	videoId: playState.videoElement.id,
        // 	title: playState.videoElement.snippet.title,
        // 	channelTitle: playState.videoElement.snippet.channelTitle,
        // 	tags: playState.videoElement.snippet.tags,
        // 	thumbnail: playState.videoElement.snippet.thumbnails.high.url,
        // 	rating: 0
        // });
        // if (navigator.onLine) saveHistoryToServer(playState.videoElement);
        addMediaSession({
            artist: playState.videoElement.snippet.channelTitle,
            title: playState.videoElement.snippet.title,
            artwork: [{
                src: playState.videoElement.snippet.thumbnails.high.url,
                sizes: "96x96",
                type: "image/png"
            }]
        }, {
            playAudio: () => playState.audioElement.play(),
            pauseAudio: () => playState.audioElement.pause()
        }, playState.audioElement);
    }, []);
    return <React.Fragment>
        {
            tv ?
                <Slide in={playerState.MiniPlayer} direction={"top"}><AppBar
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
                                        onClick={() => console.log(playState)}
                                        alt={playState.videoElement.snippet.title}
                                        image={playState.videoElement.snippet.thumbnails.high.url}
                                        title={playState.videoElement.snippet.title}
                                        loading={"lazy"}
                                        style={{height: "11rem", width: "100%"}}
                                    />
                                    <div style={{width: "100%", position: "absolute"}}><CustomMiniPlayerSlider/></div>
                                </React.Fragment>
                                <CardContent onClick={ReOpenDialog} className={"text-left"}>
                                    <Typography gutterBottom variant="h6" component="p" className={"text-truncate"}>
                                        {playState.videoElement.snippet.title.slice(0, 70) + " ..."}
                                    </Typography>
                                    <Typography variant="body2" color="textSecondary"
                                                style={{textDecoration: "none"}}
                                                component={Link}
                                                to={`/artist?id=${playState.videoElement.snippet.channelId}`}
                                                className={"text-truncate"}>
                                        {/*{playState.videoElement.snippet.channelTitle}*/}
                                        {/*{playState.videoElement.snippet.description ? playState.videoElement.snippet.description.slice(0, 70) + " ..." : ""}*/}
                                        <span className={"text-muted"}>
											{playState.videoElement.snippet.channelTitle}
										</span>
                                    </Typography>
                                </CardContent>
                            </CardActionArea>
                        </FocusNode>
                    </Card>
                </AppBar></Slide>
                :
                <Slide in={playerState.MiniPlayer} direction={"bottom"}><AppBar
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
                                    e.target.src = 'http://docs-kabeersnetwork-kview-app-sta.rf.gd/Private/uploads/5f58af5918860unnamed.jpg';
                                }}
                                src={playState.videoElement.snippet.thumbnails.high.url} style={{
                                width: "4rem",
                                height: "3rem",
                                maxWidth: "5rem!important",
                                maxHeight: "4rem!important"
                            }}
                                alt={playState.videoElement.snippet.title} className={"KabeersMiniPlayerImage"}
                                loading={"lazy"}/>
                            <Typography component={"span"} className={"text-truncate p-2 KabeersMiniPlayerText"}
                                        color={"#000"} style={{
                                width: "10em",
                                color: "primary.miniPlayer.text"
                            }}>{playState.videoElement.snippet.title || "Untitled"}
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
                </Slide>
        }
    </React.Fragment>;
};

export default React.memo(MiniPlayer);
