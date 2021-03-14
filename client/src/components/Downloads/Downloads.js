import React from "react";
import "./Downloads.css";
import makeStyles from "@material-ui/core/styles/makeStyles";
import List from "@material-ui/core/List";
import {deleteDownloadedSong, downloadsToPlaylist, getSongFromStorage} from "../../functions/songs";
import DownloadListItem from "./DownloadListItem";
import Container from "@material-ui/core/Container";
import {Avatar} from "@material-ui/core";
import {useDialog} from "muibox";
import PropTypes from "prop-types";
import Grow from "@material-ui/core/Grow";
import {pure} from "recompose";
import {PlayContext} from "../../Contexts";
import ListItemText from "@material-ui/core/ListItemText";

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
        const {PlaySong: _PlaySong} = React.useContext(PlayContext);

        const PlaySong = async (data, index) => {
            const song = await getSongFromStorage(data.id);
            if (!song) return null;
            console.log(songs)
            _PlaySong({
                useProxy: false,
                songURI: URL.createObjectURL(song.blobs.audio),
                song: song.videoElement,
                others: {
                    offline: true
                },
                playList: {
                    index: index,
                    list: songs
                }
            })
            console.log("Playing", data);
        };

        const deleteDownload = async (data) => {
            try {
                dialog.confirm({
                    title: <div className={"k-dialog-body-title text-truncate"}>Delete From Downloads</div>,
                    message: <div className={"k-dialog-body-inner"}>
                        <div className={"d-flex justify-content-center mb-3"}><Avatar src={data.thumbnail}
                                                                                      alt={"Song Thumbnail"}/></div>
                        Do You want to delete {data.title} from downloads?<br/></div>,
                });
                await deleteDownloadedSong(data.id);
                await createList();
            } catch (e) {

            }
        }

        const createList = async () => setSongs(await downloadsToPlaylist());
        React.useEffect(() => {
            downloadsToPlaylist().then(setSongs);
        }, []);

        return (
            <div className={"KabeersDownloadContainer mb-5"} style={{
                marginTop: "5rem"
            }} color={"primary.dark"}>
                <Container fixed>
                    <Grow in={true}>
                        <div>
                            <ListItemText primary={"Downloads"} secondary={"Songs you downloaded"}/>
                            <List className={`${classes.root} mt-0 bg-transparent`}>
                                {
                                    songs && songs.items ? songs.items.map((song, index) => <DownloadListItem onMouseLeave={
                                        () => deleteDownload(song)
                                    } onClick={() => PlaySong(song, index)} className={"text-truncate"}
                                                                                                              song={song}/>) : null
                                }
                            </List>
                        </div>
                    </Grow>
                </Container>
            </div>
        );
    }
;

Downloads.propTypes = {
    appState: PropTypes.object
};

Downloads.defaultProps = {};

export default pure(Downloads);
