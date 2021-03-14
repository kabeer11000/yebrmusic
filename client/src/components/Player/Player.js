import React from "react";
import "./Player.css";
import {AppBar, Avatar, CircularProgress, Drawer, IconButton, Toolbar, Typography} from "@material-ui/core";
import {
    AccountCircle,
    ArrowBack,
    Cast as CastIcon,
    Done,
    Forward10,
    GetApp,
    Loop,
    Pause,
    PlayCircleOutline,
    Repeat,
    RepeatOne,
    SkipNext,
    SkipPrevious,
    Toc,
    VolumeDown,
    VolumeUp,
} from "@material-ui/icons";
import Replay10Icon from "@material-ui/icons/Replay10";
import {deleteDownloadedSong, DownloadSong, isOfflineAvailable} from "../../functions/songs";
import CustomSlider from "./CustomSlider";
import {useSnackbar} from "notistack";
import ComingNext from "./ComingNext/ComingNext";
import {useDialog} from "muibox";
import CustomVolumeSlider from "./CustomVolumeSlider";
import Grow from "@material-ui/core/Grow";
import Switch from "@material-ui/core/Switch";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import {useHistory} from "react-router-dom";
// import {castEnabled, castSnackbar, getCastDevices, sendCast} from "../../functions/Cast/Cast";
// import CastDialog from "./CastDialog";
import ImagesSlider from "./ComingNext/ImagesSlider";
import SwipeableDrawer from "@material-ui/core/SwipeableDrawer";
import {CastContext, isTvContext, PlayContext, PlayerContext} from "../../Contexts";
import addMediaSession from "../../functions/Helper/addMediaSession";
import Button from "@material-ui/core/Button";
import CastingDialog from "../CastingDialog/CastingDialog.lazy";
import Container from "@material-ui/core/Container";

const Player = () => {

    const {playState, SkipSong, AutoPlay} = React.useContext(PlayContext);
    const [playerState, setPlayerState] = React.useContext(PlayerContext)
    if (!playerState.Dialog) return null;
    const history = useHistory();
    const dialog = useDialog();
    const [, setLooping] = React.useState(<IconButton color={"primary.player.invertButtons.main"}
                                                      style={{backgroundColor: "primary.player.invertButtons.main"}}
                                                      onClick={() => {
                                                          playState.audioElement.loop = true;
                                                          setLooping(<IconButton
                                                              color={"primary.player.invertButtons.invert"}
                                                              onClick={() => {
                                                                  playState.audioElement.loop = false;
                                                              }}
                                                              style={{backgroundColor: "primary.player.invertButtons.invert"}}><Loop/></IconButton>);
                                                      }}><Loop/></IconButton>);
    const [downloadButton, setDownloadButton] = React.useState(<div/>);
    const {enqueueSnackbar} = useSnackbar();
    const [PlayList, setPlayList] = React.useState(false);
    const [AutoPlayButton, SetAutoPlayButton] = React.useState(playState.autoPlay);
    // const abortController = new AbortController();
    const [castDialogOpen, setCastDialogOpen] = React.useState(false);
    // const setBottomNav = React.useContext(BottomNavigationContext)[1];

    const handleClose = () => setPlayerState({
        MiniPlayer: true,
        Dialog: false
    });

    const downloadAudio = async () => {
        if (!navigator.onLine) return enqueueSnackbar("No Connection, Download Failed");
        try {
            setDownloadButton(<Grow in={true}><IconButton><CircularProgress
                color={"primary.light"} size={25}/></IconButton></Grow>);
            await DownloadSong({song: playState.videoElement, uri: playState.audioElement.src, rating: 0});
            setDownloadButton(<IconButton onClick={deleteDownload}><Done/></IconButton>)
        } catch (e) {
            enqueueSnackbar("Download Failed");
            setDownloadButton(<Grow in={true}><IconButton onClick={downloadAudio}><GetApp/></IconButton></Grow>);
        }
        // await downloadSong({
        // 	videoId: "object" == typeof playState.videoElement.id ? playState.videoElement.id.videoId : "string" == typeof playState.videoElement.id && (playState.videoElement.id),
        // 	rating: 0,
        // 	title: playState.videoElement.snippet.title,
        // 	channelTitle: playState.videoElement.snippet.channelTitle,
        // 	tags: playState.videoElement.snippet.tags,
        // 	videoElement: playState.videoElement,
        // 	success: () => setDownloadButton(<IconButton onClick={deleteDownload}><Done/></IconButton>),
        // 	error: () => {
        // 		enqueueSnackbar("Download Failed");
        // 		setDownloadButton(<Grow in={true}><IconButton onClick={downloadAudio}><GetApp/></IconButton></Grow>);
        // 	}
        // }, abortController);
        // // enqueueSnackbar('Download Started');
        // setDownloadButton(<Grow in={true}><IconButton onClick={deleteDownload}><CircularProgress
        // 	color={"primary.light"} size={25}/></IconButton></Grow>);
    };

    const deleteDownload = async () => {
        dialog.confirm({
            title: <div className={"k-dialog-body-title text-truncate"}>Delete From Downloads</div> || "Nothing Here!",
            message: <div className={"k-dialog-body-inner"}>
                <div className={"d-flex justify-content-center mb-3"}>
                    <Avatar src={playState.videoElement.snippet.thumbnails.high.url} alt={"Song Thumbnail"}/>
                </div>
                Do You want to delete {playState.videoElement.snippet.title} from downloads?
                <br/>
            </div> || "Nothing Here!",
        })
            .then(() => {
                let videoID = "";
                if (typeof playState.videoElement.id === "object") videoID = playState.videoElement.id.videoId;
                if (typeof playState.videoElement.id === "string") videoID = playState.videoElement.id;
                deleteDownloadedSong(videoID).then(() => setDownloadButton(<IconButton onClick={downloadAudio}><GetApp/></IconButton>));
            });
    };
    const [playing, setPlaying] = React.useState(!playState.audioElement.paused);
    React.useEffect(() => {
        // setPlaying(playState.audioElement.paused)
    }, [playState.audioElement.paused])
    const playAudio = () => {
        playState.audioElement.play();
        setPlaying(false);
    };
    const pauseAudio = () => {
        playState.audioElement.pause();
        setPlaying(true);
    };
    const isTv = React.useContext(isTvContext);
    const Cast = React.useContext(CastContext);

    React.useEffect(() => {
        isOfflineAvailable(playState.videoElement.id).then(v => setDownloadButton(v ?
            <IconButton onClick={deleteDownload}><Done/></IconButton> :
            <IconButton onClick={downloadAudio}><GetApp/></IconButton>));
    }, [playState.videoElement])
    React.useEffect(() => {
        console.log("Playing:", playState.videoElement.snippet.title);
        console.log("SRC:", playState.audioElement.src);
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
    return (
        <div className="Player">
            <CastingDialog onCancel={() => setCastDialogOpen(!castDialogOpen)} onSelect={async (id) => {
                await Cast.controls.SendPlayCast(id, {
                    ...playState,
                    audioElement: undefined
                });
                setCastDialogOpen(!castDialogOpen);
                playState.audioElement.pause();
                enqueueSnackbar(`Casting ${playState.videoElement.snippet.title} on ${id}`);
            }} open={castDialogOpen}/>
            <SwipeableDrawer
                onClose={handleClose}
                anchor={"bottom"}
                variant={"temporary"}
                ModalProps={{
                    keepMounted: true,
                }}
                PaperProps={{
                    style: {
                        // justifySelf: "center",
                        // maxWidth: isTv ? "70vw": "100%",
                        // marginTop: "0.5rem",
                        // opacity: "70%",
                        // backdropFilter: "blur(2px)",
                        borderRadius: "1rem 1rem 0 0 "
                    },
                    square: false
                }}
                // swipeAreaWidth={20}
                // disableBackdropTransition
                open={playerState.Dialog}
                // disableSwipeToOpen={!playState.videoElement}
                onOpen={() => setPlayerState({...playerState, Dialog: true})}>
                {/*<div className={"w-100 text-center justify-content-center"}><DragHandle/></div><br/>*/}
                <AppBar color={"transparent"} elevation={0} style={{position: "relative"}}>
                    <Toolbar color={"#BBBBBB"} style={{color: "#BBBBBB"}}>
                        <IconButton edge="start" onClick={handleClose} aria-label="close">
                            <ArrowBack/>
                        </IconButton>
                        <div hidden={true}>
                            <Button onClick={() => {
                            }}>
                                Send Request (Do In Incognito)
                            </Button>
                            <Button onClick={() => {
                            }}>
                                Accept Request (Do In MainTab)
                            </Button>

                        </div>
                        <div style={{flex: "1 1 auto"}}/>
                        <FormControlLabel
                            control={
                                <Switch checked={AutoPlayButton} onChange={() => {
                                    SetAutoPlayButton(!AutoPlayButton);
                                    AutoPlay(!AutoPlayButton);
                                }} name="Autoplay"/>
                            }
                            labelPlacement="start"
                            label="Autoplay"
                        />
                    </Toolbar>
                </AppBar>
                <div style={{backgroundColor: "primary.dark", height: "90vh", width: "100%", minHeight: "90vh"}}>
                    <div className={" -ImageCircle thumbnail- text-center my-0 py-0"} style={{
                        marginTop: "0rem"
                    }}>
                        <ImagesSlider PlaySong={SkipSong}/>
                        <Typography variant={"h6"} component={"div"} className={"mx-4 py-0 text-truncate text-left"}>
                            {playState.videoElement.snippet.title || "Untitled"}
                            <Typography variant={"body2"} style={{opacity: "50%"}}>
                                {playState.videoElement.snippet.channelTitle || "Unavailable"}
                            </Typography>
                        </Typography>
                        <div className={"mx-4"}><CustomSlider/></div>
                        <div className={"container mb-0 smallOnDesktop"} style={{
                            width: "100%",
                            display: "inline-flex",
                            justifyContent: "space-around",
                            transform: "translate(0%)"
                        }}>
                            {playState.playList && playState.playList.list.items[playState.playList.index - 1] ?
                                <IconButton
                                    onClick={() => SkipSong(playState.playList.list.items[playState.playList.index - 1], playState.playList.index - 1)}>
                                    <SkipPrevious/></IconButton> :
                                <IconButton disabled={true}><SkipPrevious/></IconButton>}
                            <IconButton onClick={() => playState.audioElement.currentTime -= 10}>
                                <Replay10Icon/>
                            </IconButton>
                            <div className={"-ExpandedPlayButtonContainer"}>
                                {
                                    playing ? <IconButton onClick={playAudio}><PlayCircleOutline
                                            color={"#fff"}/></IconButton> :
                                        <IconButton onClick={pauseAudio}><Pause color={"#fff"}/></IconButton>
                                }
                            </div>
                            <IconButton onClick={() => playState.audioElement.currentTime += 10}>
                                <Forward10/>
                            </IconButton>
                            {playState.playList && playState.playList.list.items[playState.playList.index + 1] ?
                                <IconButton
                                    onClick={() => SkipSong(playState.playList.list.items[playState.playList.index + 1], playState.playList.index + 1)}><SkipNext/></IconButton> :
                                <IconButton disabled={true}><SkipNext/></IconButton>}
                        </div>
                        <br/>
                        <div className={"px-4 w-100 smallOnDesktop d-inline-flex"}>
                            <IconButton onClick={() => playState.audioElement.volume = 0}><VolumeDown
                                fontSize={"small"}/></IconButton>
                            <CustomVolumeSlider/>
                            <IconButton onClick={() => playState.audioElement.volume = 1}><VolumeUp fontSize={"small"}/></IconButton>
                        </div>
                        <br/>
                        <div className={"px-4 w-100 d-inline-flex smallOnDesktop"}
                             style={{justifyContent: "space-around"}}>
                            <div hidden={true}>
                                <Button onClick={() => Cast.peers.ConnectToPeer("5ffac4f7a9ba60")}>ConnectToPeer
                                    (Incognito)</Button>
                                <Button onClick={() => Cast.peers.PeerRequestAccept("600149b285a1cc")}>AcceptPeer
                                    (Base)</Button>
                            </div>
                            <IconButton onClick={() => setCastDialogOpen(!castDialogOpen)}>{<CastIcon/>}</IconButton>
                            {playState.audioElement.loop ? (<IconButton onClick={() => {
                                setLooping(false);
                                playState.audioElement.loop = false;
                            }}><RepeatOne/></IconButton>) : (<IconButton onClick={() => {
                                setLooping(true);
                                playState.audioElement.loop = true;
                            }}><Repeat/></IconButton>)}

                            {downloadButton ? downloadButton : <IconButton><CircularProgress size={25}/></IconButton>}

                            <IconButton onClick={() => setPlayList(true)}><Toc/></IconButton>
                            <IconButton
                                onClick={() => {
                                    // setBottomNav(false);
                                    return navigator.onLine ? (history.push(`/artist?id=${playState.videoElement.channelId}`), handleClose()) : (enqueueSnackbar("No Connection"));
                                }}><AccountCircle/>
                            </IconButton>
                        </div>
                        <Container maxWidth={"md"}>
                            <Drawer
                                anchor={isTv ? "right" : "bottom"}
                                PaperProps={{
                                    style: {
                                        maxHeight: isTv ? "100%" : "90vh"
                                        // maxWidth: "20rem"
                                    }
                                }}
                                open={PlayList}
                                onClose={() => setPlayList(false)}
                                onOpen={() => setPlayList(true)}>
                                <ComingNext PlaySong={SkipSong}/>
                            </Drawer>
                        </Container>
                    </div>
                </div>
            </SwipeableDrawer>
        </div>
    );
};

Player.propTypes = {};
Player.defaultProps = {};
export default React.memo(Player);
