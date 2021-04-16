import Dialog from "@material-ui/core/Dialog";
import React from "react";
import {CastContext, CastDialogContext, PlayContext, PlayerContext, ThemeContext} from "../../../Contexts";
import AppBar from "@material-ui/core/AppBar";
import {Avatar, CircularProgress, Container, Drawer, IconButton, Typography} from "@material-ui/core";
import Toolbar from "@material-ui/core/Toolbar";
import {
    AccountCircle,
    ArrowBack,
    Cast as CastIcon,
    Done,
    Forward10,
    GetApp,
    Grade,
    Loop,
    Pause,
    PlayCircleOutline,
    Repeat,
    RepeatOne,
    SkipNext,
    SkipPrevious,
    Toc,
    VolumeDown,
    VolumeUp
} from "@material-ui/icons";
import DialogContent from "@material-ui/core/DialogContent";
import Paper from "@material-ui/core/Paper";
import Grid from "@material-ui/core/Grid";
import CustomVolumeSlider from "../CustomVolumeSlider";
import ButtonBase from "@material-ui/core/ButtonBase";
import CustomSlider from "../CustomSlider";
import Replay10Icon from "@material-ui/icons/Replay10";
import Button from "@material-ui/core/Button";
import ComingNext from "../ComingNext/ComingNext";
import Grow from "@material-ui/core/Grow";
import {deleteDownloadedSong, DownloadSong, isOfflineAvailable} from "../../../functions/SongsUtility";
import {useSnackbar} from "notistack";
import {useDialog} from "muibox";
import {useHistory} from "react-router-dom";

const LoopingButton = ({playState, setLooping}) => {
    const handleOnClick = async () => {
        playState.audioElement.loop = true;
        setLooping(<IconButton
            color={"primary.player.invertButtons.invert"}
            onClick={() => playState.audioElement.loop = false}
            style={{backgroundColor: "primary.player.invertButtons.invert"}}><Loop/></IconButton>);
    }
    return (
        <IconButton color={"primary.player.invertButtons.main"}
                    style={{backgroundColor: "primary.player.invertButtons.main"}}
                    onClick={handleOnClick}><Loop/></IconButton>
    );
}
const Player = () => {
    const [playerState, setPlayerState] = React.useContext(PlayerContext);
    if (!playerState.Dialog) return <></>;
    const [darkmode] = React.useContext(ThemeContext);

    const {playState, SkipSong} = React.useContext(PlayContext);
    const [playing, setPlaying] = React.useState(!playState.audioElement.paused);
    const [nextDrawer, setNextDrawer] = React.useState(false);
    const Cast = React.useContext(CastContext);
    const [downloadButton, setDownloadButton] = React.useState(<div/>);
    const [, setLooping] = React.useState(<LoopingButton setLooping={setLooping} playState={playState}/>);
    const [castDialog, setCastDialog] = React.useContext(CastDialogContext);
    const {enqueueSnackbar} = useSnackbar();
    const dialog = useDialog();
    const history = useHistory();
    const Song = playState.others.offline ? playState.videoElement.videoElement : playState.videoElement;

    const DownloadAudio = async () => {
        if (!navigator.onLine) return enqueueSnackbar("No Connection, Download Failed");
        try {
            setDownloadButton(<Grow in={true}><IconButton><CircularProgress
                color={"primary.light"} size={25}/></IconButton></Grow>);
            await DownloadSong({song: Song, uri: playState.audioElement.src, rating: 0});
            setDownloadButton(<IconButton onClick={DeleteDownload}><Done/></IconButton>)
        } catch (e) {
            enqueueSnackbar("Download Failed");
            setDownloadButton(<Grow in={true}><IconButton onClick={DownloadAudio}><GetApp/></IconButton></Grow>);
        }
    };

    const DeleteDownload = async () => {
        try {
            dialog.confirm({
                title: <div className={"k-dialog-body-title text-truncate"}>Delete From
                    Downloads</div> || "Nothing Here!",
                message: <div className={"k-dialog-body-inner"}>
                    <div className={"d-flex justify-content-center mb-3"}>
                        <Avatar src={Song.snippet.thumbnails.high.url} alt={"Song Thumbnail"}/>
                    </div>
                    Do You want to delete {Song.snippet.title} from downloads?
                    <br/>
                </div> || "Nothing Here!",
            });
            await deleteDownloadedSong(Song.id);
            setDownloadButton(<IconButton onClick={DownloadAudio}><GetApp/></IconButton>);
        } catch (e) {
        }
    };
    const handleClose = () => setPlayerState({
        MiniPlayer: true,
        Dialog: false
    });

    React.useEffect(() => {
        isOfflineAvailable(Song.id).then(v => setDownloadButton(v ?
            <IconButton onClick={DeleteDownload}><Done/></IconButton> :
            <IconButton onClick={DownloadAudio}><GetApp/></IconButton>));
    }, [playState.videoElement])
    return (
        <React.Fragment>
            <Dialog fullScreen={true} className={"Desktop-Player"} open={playerState.Dialog} PaperProps={{
                style: {
                    backgroundImage: `url(${Song.snippet.thumbnails.high.url})`,
                    backgroundPosition: 'center',
                    backgroundRepeat: 'no-repeat',
                    backgroundSize: 'cover',
                }
            }}>
                <DialogContent style={{
                    backdropFilter: darkmode ? 'blur(3rem) brightness(60%)' : 'blur(3rem) brightness(140%)',
                }} className={"px-5"}>
                    <AppBar color={"transparent"} className={"bg-transparent"} position={"relative"} elevation={0}>
                        <Toolbar>
                            <IconButton onClick={handleClose}>
                                <ArrowBack/>
                            </IconButton>
                        </Toolbar>
                    </AppBar>
                    <Container maxWidth={"lg"}>
                        <Grid container spacing={2}>
                            <Grid item lg={11} md={11} xl={11}>
                                <Grid container style={{
                                    marginTop: "15vh"
                                }}>
                                    <Grid item lg={4} md={4} xl={4}>
                                        <ButtonBase>
                                            <Paper className={"rounded"} style={{
                                                backgroundImage: `url(${Song.snippet.thumbnails.high.url})`,
                                                backgroundRepeat: "no-repeat",
                                                backgroundSize: "cover",
                                                backgroundPosition: "center",
                                                // filter: "blur(1px)",
                                                width: "20rem",
                                                height: "10rem"
                                            }}/>
                                        </ButtonBase>
                                    </Grid>
                                    <Grid lg={6} md={6} xl={6} item style={{
                                        marginTop: "2rem"
                                    }}>
                                        <Typography
                                            variant={"h5"}>{Song.snippet.title || "Untitled"}</Typography>
                                        <Typography variant={"button"}
                                                    style={{color: "#c1c1c1"}}>{Song.snippet.channelTitle || "Unavailable"}</Typography>
                                    </Grid>
                                </Grid>
                            </Grid>
                            <Grid item lg={1} md={1} xl={1}>
                                <div style={{
                                    display: "flex",
                                    flexDirection: "column",
                                    justifyContent: "space-around",
                                }}>
                                    <IconButton>
                                        <VolumeUp/>
                                    </IconButton>
                                    <CustomVolumeSlider style={{
                                        height: "25vh"
                                    }} orientation={"vertical"}/>
                                    <IconButton>
                                        <VolumeDown/>
                                    </IconButton>
                                </div>
                            </Grid>
                            <Grid item lg={12} md={12} xl={12} style={{
                                marginTop: "10vh"
                            }}>
                                <Container maxWidth={"md"}>
                                    <Grid container direction={"center"} spacing={0}>
                                        <CustomSlider/>
                                    </Grid>
                                </Container>
                            </Grid>
                            <Grid item lg={12} md={12} xl={12}>
                                <Container maxWidth={"md"} className={"justify-content-center"} style={{
                                    // width: "70%",
                                }}>
                                    <div className={"mb-0 smallOnDesktop"} style={{
                                        width: "100%",
                                        alignItems: "center",
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
                                                playing ? <IconButton color={"#fff"} onClick={() => {
                                                        playState.audioElement.play();
                                                        setPlaying(!playing);
                                                    }}><PlayCircleOutline
                                                        color={"#000"}/></IconButton> :
                                                    <IconButton color={"#fff"} onClick={() => {
                                                        playState.audioElement.pause();
                                                        setPlaying(!playing);
                                                    }}><Pause color={"#000"}/></IconButton>
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
                                </Container>
                            </Grid>
                            <Grid item xl={12} lg={12} md={12}>
                                <Container maxWidth={"md"}>
                                    <div className={"px-4 w-100 d-inline-flex smallOnDesktop"}
                                         style={{justifyContent: "space-around"}}>
                                        <div hidden={true}>
                                            <Button onClick={() => Cast.peers.ConnectToPeer("5ffac4f7a9ba60")}>ConnectToPeer
                                                (Incognito)</Button>
                                            <Button onClick={() => Cast.peers.PeerRequestAccept("600149b285a1cc")}>AcceptPeer
                                                (Base)</Button>
                                        </div>
                                        <IconButton onClick={() => setCastDialog(!castDialog)}>{
                                            <CastIcon/>}</IconButton>
                                        {playState.audioElement.loop ? (<IconButton onClick={() => {
                                            setLooping(false);
                                            playState.audioElement.loop = false;
                                        }}><RepeatOne/></IconButton>) : (<IconButton onClick={() => {
                                            setLooping(true);
                                            playState.audioElement.loop = true;
                                        }}><Repeat/></IconButton>)}
                                        {downloadButton ? downloadButton :
                                            <IconButton><CircularProgress size={25}/></IconButton>}
                                        <IconButton><Grade/></IconButton>
                                        <IconButton onClick={() => setNextDrawer(true)}><Toc/></IconButton>
                                        <IconButton
                                            onClick={() => navigator.onLine ? (history.push(`/artist/${Song.channelId}`), handleClose()) : (enqueueSnackbar("No Connection"))}><AccountCircle/>
                                        </IconButton>
                                    </div>
                                    <Container maxWidth={"md"}>
                                        <Drawer
                                            anchor={"right"}
                                            PaperProps={{
                                                style: {maxHeight: "100%"}
                                            }}
                                            open={nextDrawer}
                                            onClose={() => setNextDrawer(!nextDrawer)}
                                            onOpen={() => setNextDrawer(!nextDrawer)}>
                                            <ComingNext PlaySong={(a, i) => SkipSong(a, i, {
                                                Dialog: true,
                                                MiniPlayer: false
                                            })}/>
                                        </Drawer>
                                    </Container>
                                </Container>
                            </Grid>
                        </Grid>
                    </Container>
                </DialogContent>
            </Dialog>
        </React.Fragment>
    );
};
export default React.memo(Player);
