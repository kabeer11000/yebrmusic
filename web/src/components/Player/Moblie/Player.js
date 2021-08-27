import React from "react";
import "./Player.css";
import {AppBar, CircularProgress, Drawer, IconButton, Toolbar, Typography} from "@material-ui/core";
import {
	AccountCircle,
	Close,
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
import {deleteDownloadedSong, DownloadSong, isOfflineAvailable} from "../../../functions/SongsUtility";
import CustomSlider from ".././CustomSlider";
import {useSnackbar} from "notistack";
import ComingNext from ".././ComingNext/ComingNext";
import {useDialog} from "muibox";
import CustomVolumeSlider from ".././CustomVolumeSlider";
import Grow from "@material-ui/core/Grow";
import Switch from "@material-ui/core/Switch";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import {useHistory} from "react-router-dom";
import ImagesSlider from ".././ComingNext/ImagesSlider";
import SwipeableDrawer from "@material-ui/core/SwipeableDrawer";
import {PlayContext, PlayerContext} from "../../../Contexts";
import Container from "@material-ui/core/Container";
import {DialogBody} from "../../DeleteDownloadDialog";
import Strings from "../../../Strings";
import styled from "@material-ui/core/styles/styled";
import Box from "@material-ui/core/Box";
import grey from "@material-ui/core/colors/grey";

const LoopingButton = ({playState, setLooping}) => {
	const handleOnClick = async () => {
		playState.audioElement.loop = true;
		setLooping(<IconButton
			color={"primary.player.invertButtons.invert"}
			onClick={() => playState.audioElement.loop = false}
			style={{backgroundColor: "primary.player.invertButtons.invert"}}><Loop/></IconButton>);
	};
	return (
		<IconButton color={"primary.player.invertButtons.main"}
					style={{backgroundColor: "primary.player.invertButtons.main"}}
					onClick={handleOnClick}><Loop/></IconButton>
	);
};
const drawerBleeding = 56;

const StyledBox = styled(Box)(({theme}) => ({
	backgroundColor: theme.palette.mode === "light" ? "#fff" : grey[800],
}));

const Puller = styled(Box)(({theme}) => ({
	width: 30,
	height: 6,
	backgroundColor: theme.palette.mode === "light" ? grey[300] : grey[900],
	borderRadius: 3,
	position: "absolute",
	top: 8,
	left: "calc(50% - 15px)",
}));
const Player = () => {

	const [playerState, setPlayerState] = React.useContext(PlayerContext);
	if (!playerState.Dialog) return null;
	const {playState, setPlayState, SkipSong, AutoPlay} = React.useContext(PlayContext);
	const history = useHistory();
	const dialog = useDialog();
	const [, setLooping] = React.useState(<LoopingButton setLooping={setLooping} playState={playState}/>);
	const [downloadButton, setDownloadButton] = React.useState(<div/>);
	const {enqueueSnackbar} = useSnackbar();
	const [PlayList, setPlayList] = React.useState(false);
	const [AutoPlayButton, SetAutoPlayButton] = React.useState(playState.autoPlay);
	// const [castDialogOpen, setCastDialogOpen] = React.useContext(CastDialogContext);
	const Song = playState.others.offline ? playState.videoElement.videoElement : playState.videoElement;

	const handleClose = () => setPlayerState({
		MiniPlayer: true,
		Dialog: false
	});

	const DownloadAudio = async () => {
		if (!navigator.onLine) return enqueueSnackbar(Strings["Utils:Downloads:Net.NoConnection:Failed"]);
		try {
			setDownloadButton(<Grow in={true}><IconButton><CircularProgress
				color={"primary.light"} size={25}/></IconButton></Grow>);
			await DownloadSong({song: Song, uri: playState.audioElement.src, rating: 0});
			setDownloadButton(<IconButton onClick={deleteDownload}><Done/></IconButton>);
		} catch (e) {
			enqueueSnackbar(Strings["Utils:Downloads:Net.NoConnection:Failed"]);
			setDownloadButton(<Grow in={true}><IconButton onClick={DownloadAudio}><GetApp/></IconButton></Grow>);
		}
	};

	const deleteDownload = async () => {
		dialog.confirm({
			title: <div
				className={"k-dialog-body-title text-truncate"}>{Strings["Utils:Downloads:DeleteDownload.Title"]}</div> || Strings["Utils:NothingHere"],
			message: <DialogBody Song={Song}/>,
		}).then(() => {
			// if (playState.others.offline) {
			//     const newIndex = playState.playList.list?.items.findIndex(s => s.id === Song.id) + 1;
			//     SkipSong(playState.playList.list?.items[newIndex], newIndex, playerState, {
			//         filter_current: true
			//     });
			// }
			deleteDownloadedSong(Song.id);
			setDownloadButton(<IconButton
				onClick={DownloadAudio}><GetApp/></IconButton>);
		});

	};

	// console.log(playState.playList.list)
	const [playing, setPlaying] = React.useState(!playState.audioElement.paused);
	const playAudio = () => {
		playState.audioElement.play();
		setPlaying(false);
	};
	const pauseAudio = () => {
		playState.audioElement.pause();
		setPlaying(true);
	};
	// const Cast = React.useContext(CastContext);

	React.useEffect(() => {
		isOfflineAvailable(Song.id).then(v => setDownloadButton(v ?
			<IconButton onClick={deleteDownload}><Done/></IconButton> :
			<IconButton onClick={DownloadAudio}><GetApp/></IconButton>));
	}, [playState.videoElement]);
	return (
		<div className="Player">
			<SwipeableDrawer
				onClose={handleClose}
				anchor={"bottom"}
				variant={"temporary"}
				ModalProps={{
					keepMounted: true,
				}}
				PaperProps={{
					style: {
						// opacity: "0.9",
						filter: "opacity(0.9)",
						// backgroundColor: "rgba(52, 52, 52, 0.5)",
						backdropFilter: "blur(2rem)",
						// maxHeight: "99vh",
						borderRadius: "1rem 1rem 0 0"
					},
					square: false
				}}
				open={playerState.Dialog}
				onOpen={() => setPlayerState({...playerState, Dialog: true})}>
				<StyledBox
					sx={{
						position: "absolute",
						top: -drawerBleeding,
						borderTopLeftRadius: 8,
						borderTopRightRadius: 8,
						visibility: "visible",
						right: 0,
						left: 0,
					}}>
					<Puller/>
					{/*<Typography sx={{ p: 2, color: 'text.secondary' }}>51 results</Typography>*/}
				</StyledBox>
				{/*<div className={"w-100 text-center justify-content-center"}><DragHandle/></div><br/>*/}
				<AppBar color={"transparent"} elevation={0} style={{position: "relative"}}>
					<Toolbar color={"#BBBBBB"} style={{color: "#BBBBBB"}}>
						<IconButton edge="start" onClick={handleClose} aria-label="close">
							<Close/>
						</IconButton>
						<div style={{flex: "1 1 auto"}}/>
						<FormControlLabel
							control={
								<Switch checked={AutoPlayButton} onChange={() => {
									SetAutoPlayButton(!AutoPlayButton);
									AutoPlay(!AutoPlayButton);
								}} name="Autoplay"/>
							}
							labelPlacement="start"
							label={<Typography variant={"button"}>{"Autoplay".toUpperCase()}</Typography>}
						/>
					</Toolbar>
				</AppBar>
				<div style={{backgroundColor: "primary.dark", height: "90vh", width: "100%", maxHeight: "89vh"}}>
					<div className={" -ImageCircle thumbnail- text-center my-0 py-0"} style={{
						marginTop: "0rem"
					}}>
						<ImagesSlider PlaySong={SkipSong}/>
						<Typography variant={"h6"} component={"div"} className={"mx-4 py-0 text-truncate text-left"}>
							{Song.snippet.title || Strings["Utils:Song.Untitled"]}
							<Typography variant={"body2"} style={{opacity: "50%"}}>
								{Song.snippet.channelTitle || Strings["Utils:Song:Artist.Unavailable"]}
							</Typography>
						</Typography>
						<div className={"mx-4"}><CustomSlider mobile={true}/></div>
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
							{/*<div hidden={true}>*/}
							{/*    <Button onClick={() => Cast.peers.ConnectToPeer("5ffac4f7a9ba60")}>ConnectToPeer*/}
							{/*        (Incognito)</Button>*/}
							{/*    <Button onClick={() => Cast.peers.PeerRequestAccept("600149b285a1cc")}>AcceptPeer*/}
							{/*        (Base)</Button>*/}
							{/*</div>*/}
							{/*<IconButton onClick={() => setCastDialogOpen(!castDialogOpen)}>{<CastIcon/>}</IconButton>*/}
							{playState.audioElement.loop ? (<IconButton onClick={() => {
								setLooping(false);
								playState.audioElement.loop = false;
							}}><RepeatOne/></IconButton>) : (<IconButton onClick={() => {
								setLooping(true);
								playState.audioElement.loop = true;
							}}><Repeat/></IconButton>)}
							{downloadButton ? downloadButton : <IconButton><CircularProgress size={25}/></IconButton>}
							{/*<IconButton onClick={() => {*/}
							{/*}}><Grade/></IconButton>*/}
							<IconButton onClick={() => setPlayList(true)}><Toc/></IconButton>
							<IconButton
								hidden={!Song.channelId}
								onClick={() => navigator.onLine ? (history.push(`/artist/${Song.channelId}`), handleClose()) : (enqueueSnackbar("No Connection"))}>
								<AccountCircle/>
							</IconButton>
						</div>
						<Container maxWidth={"md"}>
							<Drawer
								anchor={"bottom"}
								PaperProps={{
									style: {
										maxHeight: "90vh"
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
					{/*<StarRatingDialog title={"OP SANDRA"} open={true}/>*/}
				</div>
			</SwipeableDrawer>
		</div>
	);
};

Player.propTypes = {};
Player.defaultProps = {};
export default React.memo(Player);
