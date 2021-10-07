import Dialog from "@material-ui/core/Dialog";
import React from "react";
import {PlayContext, PlayerContext, ThemeContext} from "../../../Contexts";
import AppBar from "@material-ui/core/AppBar";
import "./Player.css";
import {CircularProgress, Container, Drawer, IconButton, Typography} from "@material-ui/core";
import Toolbar from "@material-ui/core/Toolbar";
import {
    AccountCircle,
    ArrowBack,
    Done,
    Forward10,
    GetApp,
    Grade,
    MoreVert,
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
import ComingNext from "../ComingNext/ComingNext";
import Grow from "@material-ui/core/Grow";
import {deleteDownloadedSong, DownloadSong, isOfflineAvailable} from "../../../functions/SongsUtility";
import {useSnackbar} from "notistack";
import {useDialog} from "muibox";
import {useHistory} from "react-router-dom";
import {DialogBody} from "../DeleteDownloadDialog";
import MenuItem from "@material-ui/core/MenuItem";
import Menu from "@material-ui/core/Menu";
import {useNetwork} from "../../../Hooks";

const Player = () => {
    const [playerState, setPlayerState] = React.useContext(PlayerContext);
    if (!playerState.Dialog) return null;
    const {playState, SkipSong} = React.useContext(PlayContext);
    const [playing, setPlaying] = React.useState(!playState.audioElement.paused);
    const [nextDrawer, setNextDrawer] = React.useState(false);
    const [downloadButton, setDownloadButton] = React.useState(<div/>);
    const [, setLooping] = React.useState(playState.audioElement.loop);
    const {enqueueSnackbar} = useSnackbar();
    const dialog = useDialog();
    const history = useHistory();
    const online = useNetwork();
    const Song = playState.others.offline ? playState.videoElement.videoElement : playState.videoElement;

    const DownloadAudio = async () => {
        if (!online) return enqueueSnackbar("No Connection, Download Failed");
        try {
            setDownloadButton(<Grow in={true}><IconButton><CircularProgress
                color={"primary.light"} size={25}/></IconButton></Grow>);
            await DownloadSong({song: Song, uri: playState.audioElement.src, rating: 0});
            setDownloadButton(<IconButton onClick={DeleteDownload}><Done/></IconButton>);
        } catch (e) {
            enqueueSnackbar("Download Failed");
            setDownloadButton(<Grow in={true}><IconButton onClick={DownloadAudio}><GetApp/></IconButton></Grow>);
        }
    };

    const DeleteDownload = async () => {
        dialog.confirm({
            title: <div className={"k-dialog-body-title text-truncate"}>Delete From
                Downloads</div> || "Nothing Here!",
            message: <DialogBody Song={Song}/>,
        }).then(() => deleteDownloadedSong(Song.id) && setDownloadButton(<IconButton
            onClick={DownloadAudio}><GetApp/></IconButton>)).catch(() => {
        });
    };
    const handleClose = () => setPlayerState({
        MiniPlayer: true,
        Dialog: false
    });

    React.useEffect(() => {
        isOfflineAvailable(Song.id).then(v => setDownloadButton(v ?
            <IconButton onClick={DeleteDownload}><Done/></IconButton> :
            <IconButton onClick={DownloadAudio}><GetApp/></IconButton>));
    }, [playState.videoElement]);
    const [darkmode] = React.useContext(ThemeContext);
    const [anchorEl, setAnchorEl] = React.useState(null);

    return (
        <React.Fragment>
            <Dialog fullScreen={true} className={"Desktop-Player"} open={playerState.Dialog} PaperProps={{
                style: {
                    transition: "background 300ms ease-in 200ms",
                    backgroundImage: `url(${Song.snippet.thumbnails.high.url})`,
                    backgroundPosition: "center",
                    backgroundRepeat: "no-repeat",
                    backgroundSize: "cover",
                }
            }}>
                <DialogContent
                    style={{backdropFilter: darkmode ? "blur(3rem) brightness(30%)" : "blur(3rem) brightness(300%)"}}
                    className={"px-5"}>
                    <AppBar color={"transparent"} className={"bg-transparent"} position={"relative"} elevation={0}>
                        <Toolbar>
                            <IconButton onClick={handleClose}>
                                <ArrowBack/>
                            </IconButton>
                        </Toolbar>
                    </AppBar>
                    <Container maxWidth={"lg"}>
                        <Grid className={"w-100"} container spacing={0}>
                            <Grid className={"w-100"} item sm={11} lg={11} md={11} xl={11}>
                                <Grid container className={"w-100"} style={{marginTop: "15vh"}}>
                                    <Grid item className={"w-100"} lg={4} md={4} xl={4}>
                                        <ButtonBase>
                                            <Paper className={"rounded"} style={{
                                                backgroundImage: `url(${Song.snippet.thumbnails.high.url})`,
                                                backgroundRepeat: "no-repeat",
                                                backgroundSize: "cover",
                                                backgroundPosition: "center",
                                                width: "20rem",
                                                height: "10rem"
                                            }}/>
                                        </ButtonBase>
                                    </Grid>
                                    <Grid className={"w-100"} lg={6} md={6} xl={6} item style={{marginTop: "2rem"}}>
                                        <Typography
                                            variant={"h5"}>{Song.snippet.title || "Untitled"}</Typography>
                                        <Typography variant={"button"}
                                                    style={{color: "#c1c1c1"}}>{Song.snippet.channelTitle || "Unavailable"}</Typography>
                                    </Grid>
                                </Grid>
                            </Grid>
                            <Grid item className={"d-flex justify-content-center"} sm={11} lg={1} md={1} xl={1}>
                                <div style={{
                                    display: "flex",
                                    flexDirection: "column",
                                    justifyContent: "space-around",
                                }}>
                                    <IconButton onClick={() => playState.audioElement.volume = 1}>
                                        <VolumeUp/>
                                    </IconButton>
                                    <CustomVolumeSlider style={{height: "25vh"}} orientation={"vertical"}/>
                                    <IconButton onClick={() => playState.audioElement.volume = 0}>
                                        <VolumeDown/>
                                    </IconButton>
                                </div>
                            </Grid>
                            <Grid item className={"w-100"} lg={12} md={12} xl={12} style={{marginTop: "10vh"}}>
                                <Container maxWidth={"md"}>
                                    <Grid className={"w-100"} container direction={"center"} spacing={0}>
                                        <CustomSlider/>
                                    </Grid>
                                </Container>
                            </Grid>
                            <Grid item className={"w-100"} lg={12} md={12} xl={12}>
                                <Container maxWidth={"md"} className={"d-flex justify-content-center w-100"}>
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
                                                onClick={() => SkipSong(playState.playList.list.items[playState.playList.index + 1], playState.playList.index + 1, {
                                                    Dialog: true,
                                                    MiniPlayer: false
                                                })}><SkipNext/></IconButton> :
                                            <IconButton disabled={true}><SkipNext/></IconButton>}
                                    </div>
                                </Container>
                            </Grid>
                            <Grid item className={"w-100"} xl={12} lg={12} md={12}>
                                <Container maxWidth={"md"} className={"w-100 d-flex justify-content-center"}>
                                    <div className={"px-4 d-flex smallOnDesktop"}
                                         style={{justifyContent: "space-around"}}>
                                        {playState.audioElement.loop ? (<IconButton onClick={() => {
                                            setLooping(false);
                                            playState.audioElement.loop = false;
                                        }}><RepeatOne/></IconButton>) : (<IconButton onClick={() => {
                                            setLooping(true);
                                            playState.audioElement.loop = true;
                                        }}><Repeat/></IconButton>)}
                                        {downloadButton ? downloadButton :
                                            <IconButton><CircularProgress size={25}/></IconButton>}
                                        <IconButton hidden><Grade/></IconButton>
                                        <IconButton onClick={() => setNextDrawer(true)}><Toc/></IconButton>
                                        <IconButton
                                            // hidden={!Song.channelId && !Song.snippet.channelId}
                                            onClick={() => online ? (history.push(`/artist/${Song.channelId || Song.snippet.channelId}`), handleClose()) : (enqueueSnackbar("No Connection"))}>
                                            <AccountCircle/>
                                        </IconButton>
                                        <IconButton aria-controls="simple-menu" aria-haspopup="true"
                                                    onClick={(e) => setAnchorEl(e.currentTarget)}>
                                            <MoreVert/>
                                        </IconButton>
                                        <Menu
                                            id="simple-menu"
                                            anchorEl={anchorEl}
                                            keepMounted
                                            open={Boolean(anchorEl)}
                                            onClose={() => setAnchorEl(null)}>
                                            <MenuItem onClick={async () => {
                                                await navigator.share({
                                                    url: `https://${window.location.host}/?play=${Song.id}&player=dialog&utm_source=kn.music.sources.desktop.WEB_SHARE`,
                                                    title: `Listen to ${Song.snippet.title} on Yebr`,
                                                    text: `Yebr music, podcasts and culture - By Kabeer's Network`
                                                });
                                                setAnchorEl(null);
                                            }}>Share</MenuItem>
                                            <MenuItem onClick={async () => {
                                                await navigator.clipboard.writeText(`https://${window.location.host}/?play=${Song.id}&player=dialog&utm_source=kn.music.sources.desktop.WEB_COPY`);
                                                setAnchorEl(null);
                                            }}>Copy Link</MenuItem>
                                        </Menu>
                                    </div>
                                </Container>
                            </Grid>
                        </Grid>
                    </Container>
                    <Container maxWidth={"md"} className={"w-100"}>
                        <Drawer
                            anchor={"right"}
                            PaperProps={{
                                style: {maxHeight: "100%", maxWidth: "40vw"}
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
                </DialogContent>
            </Dialog>
        </React.Fragment>
    );
};
export default React.memo(Player);
