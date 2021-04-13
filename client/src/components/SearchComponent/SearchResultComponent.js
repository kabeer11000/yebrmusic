import React from "react";
import "./SearchComponent.css";
import Dialog from "@material-ui/core/Dialog";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import IconButton from "@material-ui/core/IconButton";
import {ArrowBack} from "@material-ui/icons";
import InputBase from "@material-ui/core/InputBase";
import {SearchYoutube} from "../../functions/Search";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";
import makeStyles from "@material-ui/core/styles/makeStyles";
import {Link, useHistory} from "react-router-dom";
import Avatar from "@material-ui/core/Avatar";
import {getSong, SuggestOfflineSongs} from "../../functions/SongsUtility";
import {Slide} from "@material-ui/core";
import SkeletonList from "../SkeletonList/SkeletonList";
import Divider from "@material-ui/core/Divider";
import {PlayContext, SearchContext} from "../../Contexts";
import SessionRecommendation from "../../functions/SessionRecommendation";


const useStyles = makeStyles((theme) => ({
    root: {
        marginTop: "1rem",
        padding: "2px 4px",
        display: "flex",
        alignItems: "center",
        width: "100%",
    },
    input: {
        marginLeft: theme.spacing(1),
        flex: 1,
    },
    iconButton: {
        padding: 10,
    },
    divider: {
        height: 28,
        margin: 4,
    },
}));
const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="left" ref={ref} {...props} />;
});

const SearchResultComponent = () => {
    const history = useHistory();
    const classes = useStyles();

    const [open, setOpen] = React.useState(true);
    const [listItems, setListItems] = React.useState(null);
    const {PlaySong} = React.useContext(PlayContext);

    const abortController = new AbortController();
    const [query] = React.useContext(SearchContext);

    // const errorPage = (message = "No Internet Connection", button = <Button component={Link}
    //                                                                         to={"/search"}>Retry</Button>) => (
    //     <div className={"errorPage text-center"}
    //          style={{position: "absolute", top: "50%", left: "50%", transform: "translate(-50%, -50%)"}}>
    //         <img src={"/./assets/icons/darkmode_nothingfound.svg"} style={{width: "8rem", height: "auto"}}
    //              alt={"Kabeers Music Logo"}/>
    //         <br/>
    //         <div className={"text-truncate"}>{message}</div>
    //         {button}
    //     </div>
    // );


    React.useEffect(() => {
        if (!query) return history.push("/search");
        SessionRecommendation.addSearch(query);
        if (navigator.onLine) SearchYoutube(query, abortController).then(setListItems);
        else SuggestOfflineSongs(query).then(a => {
            setListItems({
                accounts: [],
                etag: "b78bc54f-dd76-4ed9-ae0e-fab7e11a5336",
                items: a,
                kind: "KabeersMusic#searchListResponse",
                pageInfo: {totalResults: a.length},
                regionCode: "PK",
                title: query,
            });
            console.log(a);
        });
        return () => abortController.abort();
    }, []);
    return (
        <div className="SearchResultComponent">
            <Dialog fullScreen open={open}>
                <AppBar className={"fixed-top"}>
                    <Toolbar component={Link} to={`/search?q=${query}`} style={{textDecoration: "none"}}>
                        {window.history ?
                            <IconButton onClick={() => setOpen(false)} component={Link} style={{textDecoration: "none"}}
                                        to={"/home"} color="primary.light"
                                        visibility={false}>
                                <ArrowBack/>
                            </IconButton> : null}
                        <InputBase
                            autoCapitalize={true}
                            autoComplete={true}
                            value={query}
                            className={`${classes.input} text-light`}
                            placeholder="Search Kabeers Music"
                            inputProps={{"aria-label": "Search Kabeers Music"}}
                        />
                    </Toolbar>
                </AppBar>
                <div className={"container px-3"} style={{marginTop: "4rem"}}>
                    <div className={"row"}>
                        {listItems && listItems.items ? (
                            <React.Fragment>
                                {listItems.accounts.length ? (
                                    <React.Fragment>
                                        {listItems.accounts.map((value, index) => (
                                            <ListItem component={Link} button key={index}
                                                      to={`/artist/${value.url.split("/").slice(-1)[0]}`}>
                                                <ListItemIcon>
                                                    <Avatar alt={value.title} src={value.image}/>
                                                </ListItemIcon>
                                                <ListItemText primary={`${value.title}`}
                                                              secondary={value.subCountLabel ? `${value.subCountLabel} Listeners` : "No Listeners"}/>
                                            </ListItem>
                                        ))}
                                        <Divider/>
                                    </React.Fragment>
                                ) : null}
                                {listItems.items.length ? (
                                    <React.Fragment>
                                        {listItems.items.map((song, index) => (
                                            <ListItem button key={index} onClick={async () => {
                                                if (song.item) {
                                                    // song.item.videoElement.snippet.thumbnails.high.url = URL.createObjectURL(song.item.blobs.thumbnail)
                                                    return PlaySong({
                                                        useProxy: false,
                                                        songURI: URL.createObjectURL(song.item.blobs.audio),
                                                        song: song.item.videoElement,
                                                        others: {
                                                            offline: true
                                                        },
                                                        playList: {
                                                            index: index,
                                                            list: ({
                                                                ...listItems,
                                                                items: listItems.items.map(a => ({
                                                                    ...a.item,
                                                                    isOffline: true
                                                                }))
                                                            })
                                                        }
                                                    })
                                                }
                                                return PlaySong({
                                                    useProxy: true,
                                                    songURI: await getSong(song.id),
                                                    song: song,
                                                    playList: {
                                                        list: listItems,
                                                        index: index
                                                    }
                                                })
                                            }
                                                // a({
                                                // 	useProxy: false,
                                                // 	songURI: URL.createObjectURL(data.blobs.audio),
                                                // 	song: data.videoElement,
                                                // 	playList: {
                                                // 		...playState.playList,
                                                // 		index: index
                                                // 	}
                                                // })
                                                // await PlaySong(value, {
                                                // 	list: listItems, index: index
                                                // })
                                            }>
                                                {song.item ? <React.Fragment>
                                                    <ListItemIcon>
                                                        <Avatar alt={song.item.videoElement.snippet.title}
                                                                src={song.item.videoElement.snippet.thumbnails.default.url}/>
                                                    </ListItemIcon>
                                                    <ListItemText primary={`${song.item.videoElement.snippet.title}`}
                                                                  secondary={`${song.item.videoElement.snippet.channelTitle}`}/>
                                                </React.Fragment> : <React.Fragment>
                                                    <ListItemIcon>
                                                        <Avatar alt={song.snippet.title}
                                                                src={song.snippet.thumbnails.default.url}/>
                                                    </ListItemIcon>
                                                    <ListItemText primary={`${song.snippet.title}`}
                                                                  secondary={`${song.snippet.channelTitle}`}/>
                                                </React.Fragment>}
                                            </ListItem>
                                        ))}
                                    </React.Fragment>
                                ) : null}
                            </React.Fragment>
                        ) : <SkeletonList length={10}/>}
                    </div>
                </div>
            </Dialog>
        </div>
    );
};

SearchResultComponent.propTypes = {};

SearchResultComponent.defaultProps = {};

export default React.memo(SearchResultComponent);
