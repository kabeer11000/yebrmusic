import React from "react";
import "./SearchComponentTV.css";
import {SearchYoutube, SuggestSearch} from "../../functions/Search";
import {downloadsToPlaylist, getSong, SuggestOfflineSongs} from "../../functions/SongsUtility";
import {useHistory} from "react-router-dom";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import {SearchOutlined} from "@material-ui/icons";
import ListItemText from "@material-ui/core/ListItemText";
import {makeStyles} from "@material-ui/core/styles";
import Keyboard from "react-simple-keyboard";
import "react-simple-keyboard/build/css/index.css";
import Paper from "@material-ui/core/Paper";
import InputBase from "@material-ui/core/InputBase";
import Divider from "@material-ui/core/Divider";
import IconButton from "@material-ui/core/IconButton";
import SearchIcon from "@material-ui/icons/Search";
import Container from "@material-ui/core/Container";
import SongCard from "../SongCard/SongCard.lazy";
import {FocusNode} from "@please/lrud";
import {storageIndex} from "../../functions/Helper/StorageIndex";
import Slide from "@material-ui/core/Slide";
import Grow from "@material-ui/core/Grow";
import Log from "../../functions/Log";
import {PlayContext, SearchContext} from "../../Contexts";
import SessionRecommendation from "../../functions/SessionRecommendation";

const useStyles = makeStyles((theme) => ({
    root: {
        padding: "2px 4px",
        display: "flex",
        alignItems: "center",
        width: 400,
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
// var route = "/users/:uid/pictures";
// var routeMatcher = new RegExp(route.replace(/:[^\s/]+/g, "([\\w-]+)"));
// var url = "/users/1024/pictures";
//
// console.log(url.match(routeMatcher));

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return "";
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

const EmptyState = () => (
    <Grow in={true}>
        <div className={"errorPage text-center"}
             style={{
                 position: "absolute",
                 top: "50%",
                 left: "22.5%",
                 transform: "translate(-50%, -50%)"
             }}>
            <img src={"./assets/icons/darkmode_nothingfound.svg"} style={{width: "8rem", height: "auto"}}
                 alt={"Yebr Music Logo"}/>
            <br/>
            <div>{navigator.onLine ? "Results will appear as you type" : "Searching In Downloads"}</div>
        </div>
    </Grow>
)
const SearchComponentTV = () => {
    const classes = useStyles();

    const history = useHistory();
    const [query, setQuery] = React.useContext(SearchContext);
    const [open, setOpen] = React.useState(false);
    const {PlaySong} = React.useContext(PlayContext);
    const [state, setState] = React.useState(null);
    const [predictions, setPredictions] = React.useState(null);

    const Search = async (query) => {
        setQuery(query);
        try {
            if (navigator.onLine) {
                if (query.length >= 5) SearchYoutube(query).then(setState);
                setPredictions(await SuggestSearch(query));
            } else {
                const songs = await SuggestOfflineSongs(query);
                setState(songs);
                setPredictions(songs);
            }
            history.push({
                pathname: "search",
                search: "?" + new URLSearchParams({q: query}).toString()
            });
            await SessionRecommendation.addSearch(query);
        } catch (e) {
            Log("An Error Occurred", e.message);
        }
    }

    return (
        <Slide in={true} direction={"left"}>
            <div style={{height: "100%"}}>
                <div style={{width: "100%", display: "inline-flex", height: "49vh", justifyContent: "space-between"}}>
                    <FocusNode
                        onFocused={() => setOpen(!open)}
                        onBlurred={() => setOpen(!open)}>
                        <Paper component="form" className={`ml-5 mt-5 ${classes.root}`}>
                            <IconButton>
                                <SearchIcon/>
                            </IconButton>
                            <Divider className={classes.divider} orientation="vertical"/>
                            <InputBase
                                autoFocus
                                className={classes.input}
                                value={query}
                                placeholder="Search Yebr"
                                inputProps={{"aria-label": "search yebr music"}}
                                onChange={({target}) => Search(target.value)}
                            />
                        </Paper>
                        <br/>
                        <Paper className={"ml-5"}
                               style={{
                                   maxWidth: 400,
                                   maxHeight: "30vh",
                                   overflow: "hidden"
                               }} hidden={!open}>
                            {
                                predictions?.length ? predictions.map((value, index) => (
                                        <ListItem button key={index}
                                                  onClick={() => Search(value.suggestion.attributes.data)}>
                                            <ListItemIcon>
                                                <SearchOutlined/>
                                            </ListItemIcon>
                                            <ListItemText primary={`${value.suggestion.attributes.data}`}/>
                                        </ListItem>
                                    )
                                ) : <EmptyState/>
                            }
                        </Paper>
                    </FocusNode>
                    <div>
                        {
                            localStorage.getItem(storageIndex.onScreenKeyboard) ? (
                                <div style={{width: "50vw", color: "black", height: "100%"}}
                                     className={"bg-transparent mr-5 mt-5"}>
                                    <Keyboard
                                        className={"bg-transparent h-100 w-100"}
                                        onChange={Search}
                                        display={{
                                            "{bksp}": "<svg class=\"MuiSvgIcon-root jss172\" focusable=\"false\" viewBox=\"0 0 24 24\" aria-hidden=\"true\"><path d=\"M22 3H7c-.69 0-1.23.35-1.59.88L0 12l5.41 8.11c.36.53.9.89 1.59.89h15c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-3 12.59L17.59 17 14 13.41 10.41 17 9 15.59 12.59 12 9 8.41 10.41 7 14 10.59 17.59 7 19 8.41 15.41 12 19 15.59z\"></path></svg>",
                                            "{enter}": "< enter",
                                            "{shift}": "shift",
                                            "{s}": "shift",
                                            "{tab}": "tab",
                                            "{lock}": "caps",
                                            "{accept}": "Submit",
                                            "{space}": "<svg class=\"MuiSvgIcon-root jss172\" focusable=\"false\" viewBox=\"0 0 24 24\" aria-hidden=\"true\"><path d=\"M18 9v4H6V9H4v6h16V9z\"></path></svg>",
                                            "{//}": " "
                                        }}
                                        {...localStorage.getItem(storageIndex.onScreenKeyboard) ? ({
                                            theme: "hg-theme-default"
                                        }) : null}
                                        layout={{
                                            "default": [
                                                "1 2 3 4 5 6 7 8 9 0",
                                                "q w e r t y u i o p",
                                                "a s d f g h j k l .com",
                                                "z x c v b n m @ {bksp}",
                                                "{space}"
                                            ],
                                            "shift": [
                                                "~ ! @ # $ % ^ & * ( ) _ + {bksp}",
                                                "{tab} Q W E R T Y U I O P { } |",
                                                "{lock} A S D F G H J K L : \" {enter}",
                                                "{shift} Z X C V B N M < > ? {shift}",
                                                ".com @ {space}"
                                            ]
                                        }}
                                    />
                                </div>
                            ) : null
                        }
                    </div>
                </div>
                <div className={"mt-0"}>
                    {state && (navigator.onLine ? state.items : true) ? (
                        <Container maxWidth="xl" className={"px-0 mx-0"} style={{maxWidth: "100vw"}}>
                            <div className={"cardSlider Slider"}>
                                {
                                    navigator.onLine ?
                                        state.items.map((song, index) => (
                                            <SongCard key={index}
                                                      song={song}
                                                      onClick={async () => PlaySong({
                                                          useProxy: true,
                                                          songURI: await getSong(song.id),
                                                          song: song,
                                                          playList: {
                                                              index: index,
                                                              list: state
                                                          }
                                                      })}/>
                                        )) : state.map((song, index) => (
                                            <SongCard key={index}
                                                      song={song.item.videoElement}
                                                      onClick={async () => PlaySong({
                                                          useProxy: false,
                                                          songURI: URL.createObjectURL(song.blobs.audio),
                                                          song: song.videoElement,
                                                          others: {
                                                              offline: true
                                                          },
                                                          playList: {
                                                              index: index,
                                                              list: await downloadsToPlaylist()
                                                          }
                                                      })}/>
                                        ))
                                }
                            </div>
                        </Container>) : null
                    }
                </div>
            </div>
        </Slide>
    );
};

SearchComponentTV.propTypes = {};

SearchComponentTV.defaultProps = {};

export default React.memo(SearchComponentTV);
