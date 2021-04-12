import React from "react";
import "./SearchComponent.css";
import Dialog from "@material-ui/core/Dialog";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import IconButton from "@material-ui/core/IconButton";
import {ArrowBack, SearchOutlined} from "@material-ui/icons";
import InputBase from "@material-ui/core/InputBase";
import {SuggestSearch} from "../../functions/suggestSearch";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";
import makeStyles from "@material-ui/core/styles/makeStyles";
import {Link, useHistory} from "react-router-dom";
import {SuggestOfflineSongs} from "../../functions/songs";
import Preloader from "../Preloader/Preloader";
import {Slide} from "@material-ui/core";
import {SearchContext} from "../../Contexts";
import {useNetwork} from "../../Hooks";

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

const SearchComponent = (props) => {
    let history = useHistory();
    const [open, setOpen] = React.useState(true);
    const [queryArray, setQueryArray] = React.useState([]);
    const abortController = new AbortController();
    const online = useNetwork();
    const [listItems, setListItems] = React.useState(
        <div className={"errorPage text-center w-100"}
             style={{
                 position: "absolute",
                 top: "50%",
                 left: "50%",
                 transform: "translate(-50%, -50%)"
             }}>
            <img src={"./assets/icons/darkmode_nothingfound.svg"} style={{width: "8rem", height: "auto"}}
                 alt={"Kabeers Music Logo"}/>
            <br/>
            <ListItemText primary={online ? "Searching Kabeer's Music" : "Searching In Downloads"}
                          secondary={"Results will appear as you type"}/>
        </div>
    );
    const classes = useStyles();
    const [query, setQuery] = React.useContext(SearchContext);
    const ListItems = () => {
        if (!queryArray) return;
        setListItems(() => queryArray.map((value, index) => {
            if (!value) return;
            return (
                <ListItem button key={index} onClick={() => {
                    setQuery(value.suggestion.attributes.data);
                }} component={Link} to={"/search/results"}>
                    <ListItemIcon>
                        <SearchOutlined/>
                    </ListItemIcon>
                    <ListItemText primary={`${value.suggestion.attributes.data}`}/>
                </ListItem>
            );
        }));
    };

    const Search = async (e) => {
        if (e.key === "Enter") return query ? history.push("/search/results") : null;
        if (online) SuggestSearch(e.target.value, abortController).then(v => v && v.length ? setQueryArray(v) : setQueryArray([]));
        else SuggestOfflineSongs(e.target.value).then(t => setQueryArray(t.map(t => ({suggestion: {attributes: {data: t.item.title}}}))));
        ListItems();
        props.history.push({
            pathname: "search",
            search: "?" + new URLSearchParams({q: e.target.value}).toString()
        });
        setQuery(e.target.value);
    };

    React.useEffect(() => () => abortController.abort(), []);
    return (
        <div className="SearchComponent">
            <Dialog fullScreen open={open} TransitionComponent={Transition}>
                <AppBar className={"fixed-top"}>
                    <Toolbar>
                        {window.history ? <IconButton onClick={() => {
                            setOpen(false);
                        }} component={Link} to={"/home"} color="primary.light" visibility={false}>
                            <ArrowBack color="#FFF"/>
                        </IconButton> : <></>}
                        <InputBase
                            // autoCapitalize={true}
                            // autoComplete={true}
                            autoFocus={true}
                            onKeyUp={Search}
                            className={`${classes.input} text-light`}
                            placeholder="Search Kabeers Music"
                            inputProps={{"aria-label": "Search Kabeers Music"}}
                        />
                    </Toolbar>
                </AppBar>
                <div className="container px-3" style={{marginTop: "4rem"}}>
                    <div className="row">
                        {listItems}
                        {listItems ? null : <Preloader/>}
                    </div>
                </div>
            </Dialog>
        </div>
    );
};
SearchComponent.propTypes = {};
SearchComponent.defaultProps = {};

export default React.memo(SearchComponent);
