import React from "react";
import "./Downloads.css";
import { makeStyles } from "@mui/styles";
import List from "@material-ui/core/List";
import {deleteDownloadedSong, downloadsToPlaylist} from "../../functions/SongsUtility";
import DownloadListItem from "./DownloadListItem";
import Container from "@material-ui/core/Container";
import {useDialog} from "muibox";
// import PropTypes from "prop-types";
import Grow from "@material-ui/core/Grow";
// import {pure} from "recompose";
import {isTvContext, PlayContext} from "../../Contexts";
import ListItemText from "@material-ui/core/ListItemText";
import Grid from "@material-ui/core/Grid";
import {OfflinePin} from "@material-ui/icons";
import IconButton from "@material-ui/core/IconButton";
import Typography from "@material-ui/core/Typography";
import Strings from "../../Strings";
import {DialogBody} from "../DeleteDownloadDialog";

const useStyles = makeStyles((theme) => ({
	root: {
		width: "100%",
		maxWidth: "100%",
		backgroundColor: theme.palette.background.paper,
	},
	inline: {
		display: "inline",
	},
}));


const Downloads = () => {
	const classes = useStyles();
	const dialog = useDialog();
	const [songs, setSongs] = React.useState(null);
	const {PlaySong} = React.useContext(PlayContext);
	const tv = React.useContext(isTvContext);

	const deleteDownload = async (data) => {
		dialog.confirm({
			title: <div
				className={"k-dialog-body-title text-truncate"}>{Strings["Utils:Downloads:DeleteDownload.Title"]}</div> || Strings["Utils:NothingHere"],
			message: <DialogBody Song={data.videoElement}/>,
		}).then(async () => {
			await deleteDownloadedSong(data.id);
			setSongs(await downloadsToPlaylist());
		});
	};
	React.useEffect(() => {
		downloadsToPlaylist().then(setSongs);
	}, []);

	return (
		<div className={"KabeersDownloadContainer mb-5"} style={{marginTop: "5rem"}} color={"primary.dark"}>
			<Container fixed>
				<Grow in={true}>
					<div>
						<ListItemText primary={"Downloads"} secondary={"Songs you downloaded"}/>
						{
							songs && songs.items.length ? (
								<List className={`${classes.root} mt-0 bg-transparent`}>
                                    <Grid container spacing={tv ? 0 : 0}>
                                        {songs.items.map((song, index) => <Grid className={"w-100"} item md={4} xl={4}>
                                            <DownloadListItem
                                                onMouseLeave={() => deleteDownload(song)}
                                                onClick={async () => PlaySong({
                                                    useProxy: false,
                                                    songURI: URL.createObjectURL(song.blobs.audio),
                                                    song: song,
                                                    others: {
                                                        offline: true
                                                    },
                                                    playList: {
                                                        index: index,
                                                        list: songs // {...songs, items: songs.items.map(a => a.videoElement)}
                                                    }
                                                })} song={song}/>
										</Grid>)}
									</Grid>
								</List>
							) : (
								<Container style={{
									width: "100%",
									height: "100%"
								}}>
									<IconButton className={"w-100 mt-5 h-100 NoDownloadsIndicator"}>
										<OfflinePin style={{
											width: "10rem",
											height: "10rem",
											opacity: "20%",
											position: "absolute",
											top: "50%",
											left: "50%",
											transform: "translate(-50%, -50%)"
										}}/>
									</IconButton>
									<Typography className={"text-center"}>Songs you download will appear
										here!</Typography>
								</Container>
							)
						}
					</div>
				</Grow>
			</Container>
		</div>
	);
};

Downloads.propTypes = {};

Downloads.defaultProps = {};

export default React.memo(Downloads);
