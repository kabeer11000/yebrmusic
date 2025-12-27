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
import { makeStyles } from "@mui/styles";
import {useHistory} from "react-router-dom";
import Link from "../Link"
import Avatar from "@material-ui/core/Avatar";
import {getSong, SuggestOfflineSongs} from "../../functions/SongsUtility";
import {Slide} from "@material-ui/core";
import SkeletonList from "../SkeletonList/SkeletonList";
import Divider from "@material-ui/core/Divider";
import {PlayContext, SearchContext} from "../../Contexts";
import SessionRecommendation from "../../functions/SessionRecommendation";
import {useNetwork, useQuery} from "../../Hooks";
import Log from "../../functions/Log";


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
	const [listItems, setListItems] = React.useState(null);
    const {PlaySong} = React.useContext(PlayContext);
    const query = useQuery();

	const abortController = new AbortController();
    // const [query] = React.useContext(SearchContext);

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

	const online = useNetwork();
	React.useEffect(() => {
        if (!query.get("q")) return history.push("/suggest");
        SessionRecommendation.addSearch(query.get("q"));
        if (online) SearchYoutube(query).then(setListItems);
        else SuggestOfflineSongs(query).then(results => {
            setListItems({
                accounts: [],
                etag: "b78bc54f-dd76-4ed9-ae0e-fab7e11a5336",
                items: results,
                kind: "KabeersMusic#searchListResponse",
                pageInfo: {totalResults: results.length},
                regionCode: "PK",
                title: query,
            });
            // Log("Searched");
		});
		return () => abortController.abort();
	}, [online]);
	return (
        <div className="SearchResultComponent">
            {/*<Dialog fullScreen open={open}>*/}
            <AppBar color={"inherit"} className={"fixed-top"}>
                <Toolbar component={Link} to={`/suggest?q=${query.get("q")}&r=0`} style={{textDecoration: "none"}}>
                    {window.history ?
                        <IconButton component={Link} style={{textDecoration: "none"}}
                                    to={"/home"} color="primary.light"
                                    visibility={false}>
                            <ArrowBack/>
                        </IconButton> : null}
                    <InputBase
                        autoCapitalize={true}
                        autoComplete={true}
                        value={query.get("q")}
                        className={`${classes.input} text-light`}
							placeholder="Search Yebr"
							inputProps={{"aria-label": "Search Yebr"}}
						/>
					</Toolbar>
				</AppBar>
				<div className={"container px-3"} style={{marginTop: "4rem"}}>
					<div className={"row"}>
                        {listItems?.items ? (
                            <React.Fragment>
                                {listItems.accounts.length ? (
                                    <React.Fragment>
                                        {listItems.accounts.map((value, index) => (
                                            <ListItem component={Link} button key={index}
                                                      to={`/artist/${value.url.split("/").slice(-1)[0]}`}>
                                                <ListItemIcon>
                                                    <Avatar alt={value.title} src={value.image}/>
                                                </ListItemIcon>
                                                <ListItemText
                                                    primary={<div className={"-text-truncate"}>{value.title}</div>}
                                                    secondary={<div
                                                        className={"text-truncate"}>{value.subCountLabel ? `${value.subCountLabel} Listeners` : ""}</div>}/>
                                            </ListItem>
                                        ))}
                                        <Divider/>
                                    </React.Fragment>
                                ) : null}
                                {listItems?.items?.length ? (
                                    <React.Fragment>
                                        {listItems.items.map((song, index) => (
                                            <ListItem button key={index} onClick={async () => online ? PlaySong({
                                                useProxy: true,
                                                song: song,
                                                play: true,
                                                playList: {
                                                    list: listItems,
                                                    index: index
                                                }
                                            }) : PlaySong({
                                                useProxy: false,
                                                songURI: URL.createObjectURL(song.item.blobs.audio),
                                                song: song.item,
                                                play: true,
                                                others: {
                                                    offline: true
                                                },
                                                playList: {
                                                    index: index,
                                                    list: ({
                                                        ...listItems,
                                                        items: listItems.items.map(result => result.item),
                                                    })
                                                }
                                            })}>
                                                {!online ? <React.Fragment>
                                                    <ListItemIcon>
                                                        <Avatar alt={song.item.videoElement.snippet.title}
                                                                variant="rounded"
                                                                src={song.item.videoElement.snippet.thumbnails.high.url}/>
                                                    </ListItemIcon>
                                                    <ListItemText primary={song.item.videoElement.snippet.title}
                                                                  secondary={song.item.videoElement.snippet.channelTitle}/>
                                                </React.Fragment> : <React.Fragment>
                                                    <ListItemIcon>
                                                        <Avatar alt={song.snippet.title}
                                                                variant="rounded"
                                                                src={song.snippet.thumbnails.high.url}/>
                                                    </ListItemIcon>
                                                    <ListItemText primary={song.snippet.title}
                                                                  secondary={song.snippet.channelTitle}/>
                                                </React.Fragment>}
											</ListItem>
										))}
									</React.Fragment>
								) : null}
							</React.Fragment>
						) : <SkeletonList length={10}/>}
					</div>
				</div>
            {/*</Dialog>*/}
		</div>
	);
};

SearchResultComponent.propTypes = {};

SearchResultComponent.defaultProps = {};

export default React.memo(SearchResultComponent);
