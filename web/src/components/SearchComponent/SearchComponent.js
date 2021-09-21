import React from "react";
import "./SearchComponent.css";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import IconButton from "@material-ui/core/IconButton";
import {ArrowBack, SearchOutlined} from "@material-ui/icons";
import InputBase from "@material-ui/core/InputBase";
import {SuggestSearch} from "../../functions/Search";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";
import makeStyles from "@material-ui/core/styles/makeStyles";
import {useHistory} from "react-router-dom";
import Link from "../Link"
import {SuggestOfflineSongs} from "../../functions/SongsUtility";
import {Slide} from "@material-ui/core";
import {useNetwork, useQuery} from "../../Hooks";

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="left" ref={ref} {...props} />;
});

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
const TransitionComponent = ({children, slide}) => {
    return slide ? <Slide direction="left" in={true}>
        <div>{children}</div>
    </Slide> : <React.Fragment>{children}</React.Fragment>
}


const SearchComponent = () => {
    let history = useHistory();
    const [queryArray, setQueryArray] = React.useState([]);
    const online = useNetwork();
    const classes = useStyles();
    const queryParam = useQuery();
    const [query, setQuery] = React.useState(queryParam.get("q"));

    React.useEffect(() => {
        if (queryParam.get("q")) Search({target: {value: queryParam.get("q")}})
    }, []);
    const Search = async (e) => {
        setQuery(e.target.value);
        if (e.code === "Enter" && e.target.value) return history.push(`/search?q=${e.target.value}`);
        const suggestions = online ? await SuggestSearch(e.target.value) : await SuggestOfflineSongs(e.target.value).then(t => t.map(t => ({suggestion: {attributes: {data: t.item.videoElement.snippet.title}}})));
        setQueryArray(suggestions);

        const newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + "?" + "q=" + e.target.value;
        window.history.replaceState({path: newurl}, "", newurl);
        // Log(e)
    };
    const [focus, setFocus] = React.useState(true);
    return (
        <TransitionComponent slide={queryParam.get("r")}>
            <div className="SearchComponent">
                <AppBar color={"inherit"} className={"fixed-top"}>
                    <Toolbar>
                        {window.history ?
                            <IconButton component={Link} to={"/home"} color="primary.light" visibility={false}>
                                <ArrowBack style={{color: "#FFF"}}/>
                            </IconButton> : null}
                        <InputBase
                            autoFocus={true}
                            value={query}
                            onFocus={() => setFocus(true)}
                            onBlur={() => setFocus(false)}
                            onKeyUp={Search}
                            autoComplete={false}
                            spellCheck={true} autoCapitalize={true}
                            className={`${classes.input} text-light`}
                            placeholder="Search Yebr"
                            inputProps={{"aria-label": "Search Yebr"}}
                        />
                        {focus ? null : <SearchOutlined style={{color: "#FFF"}}/>}
                    </Toolbar>
                </AppBar>
                <div className="container px-3" style={{marginTop: "4rem"}}>
                    <div className="row">
                        {(!query || !queryArray?.length) && (
                            <div className={"errorPage text-center w-100"}
                                 style={{
                                     position: "absolute",
                                     top: "50%",
                                     left: "50%",
                                     transform: "translate(-50%, -50%)"
                                 }}>
                                <img src={"./assets/icons/darkmode_nothingfound.svg"}
                                     style={{width: "8rem", height: "auto"}}
                                     alt={"Yebr Logo"}/>
                                <br/>
                                <ListItemText primary={online ? "Searching Yebr" : "Searching In Downloads"}
                                              secondary={"Suggestions will appear as you type"}/>
                            </div>
                        )}
                        {queryArray && query && queryArray.map((value, index) => (
                            <ListItem button key={index} component={Link}
                                      to={`/search?q=${value.suggestion.attributes.data}`}>
                                <ListItemIcon>
                                    <SearchOutlined/>
                                </ListItemIcon>
                                <ListItemText primary={`${value.suggestion.attributes.data}`}/>
                            </ListItem>
                        ))}
                    </div>
                </div>
            </div>
        </TransitionComponent>
    );
};
SearchComponent.propTypes = {};
SearchComponent.defaultProps = {};

export default React.memo(SearchComponent);
