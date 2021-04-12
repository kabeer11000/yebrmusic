import React from "react";
import "./Downloads.css";
import makeStyles from "@material-ui/core/styles/makeStyles";
import List from "@material-ui/core/List";
import {deleteDownloadedSong, downloadsToPlaylist} from "../../functions/songs";
import DownloadListItem from "./DownloadListItem";
import Container from "@material-ui/core/Container";
import {Avatar} from "@material-ui/core";
import {useDialog} from "muibox";
// import PropTypes from "prop-types";
import Grow from "@material-ui/core/Grow";
// import {pure} from "recompose";
import {PlayContext} from "../../Contexts";
import ListItemText from "@material-ui/core/ListItemText";
import Grid from "@material-ui/core/Grid";
import DialogContent from "@material-ui/core/DialogContent";
import {DebugLog} from "../../functions/Log";
import {OfflinePin} from "@material-ui/icons";
import IconButton from "@material-ui/core/IconButton";
import Typography from "@material-ui/core/Typography";

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

    const deleteDownload = async (data) => {
        try {
            dialog.confirm({
                ok: {
                    text: "Delete",
                },
                message: (
                    <div className={"k-dialog-body-inner"}>
                        <div className={"mb-3"}>
                            <Grid container className={"mx-0 px-0"}>
                                <Grid item xs={12} md={12}>
                                    <Avatar src={data.videoElement.snippet.thumbnails.high.url} variant={"rounded"}
                                            className={"w-100 h-auto"}/>
                                </Grid>
                                <Grid item xs={12} md={12}>
                                    <DialogContent className={"mx-0 px-0"}>
                                        <ListItemText className={"mx-0 px-0"} primary={<div>Delete from downloads</div>}
                                                      secondary={data.videoElement.snippet.title}/>
                                    </DialogContent>
                                </Grid>
                            </Grid>
                        </div>
                    </div>
                ),
            }).then(async () => {
                await deleteDownloadedSong(data.id);
                setSongs(await downloadsToPlaylist());
            });
        } catch (e) {
            DebugLog(e);
        }
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
                                    {songs.items.map((song, index) => <DownloadListItem
                                        onMouseLeave={() => deleteDownload(song)} onClick={async () => PlaySong({
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
                                    })} className={"text-truncate"} song={song}/>)}
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
