import React from "react";
import ListItem from "@material-ui/core/ListItem";
import ListItemAvatar from "@material-ui/core/ListItemAvatar";
import Avatar from "@material-ui/core/Avatar";
import ListItemText from "@material-ui/core/ListItemText";
import Chip from "@material-ui/core/Chip";
import IconButton from "@material-ui/core/IconButton";
import {MoreVert} from "@material-ui/icons";
import PropTypes from "prop-types";

const SongListItem = ({item, onClick, onOptions, options, ...props}) => (
    <ListItem {...props} button alignItems="flex-start" className={"rounded"}>
        <React.Fragment>
            <ListItemAvatar onClick={onClick}>
                <Avatar alt={item.snippet.title} variant="rounded"
                        src={item.snippet.thumbnails.high.url}/>
            </ListItemAvatar>
            <ListItemText
                primary={item.snippet.title}
                onClick={onClick}
                secondary={
                    <React.Fragment>
                        {item.snippet.channelTitle}
                        {
                            item.tags && item.tags.length ? <div className={"cardSlider Slider"}>
                                {item.tags.map((v, i) => <Chip className={"mx-1"} key={i}
                                                               label={v}/>)}
                            </div> : null
                        }
                    </React.Fragment>
                }
            />
        </React.Fragment>
        {options && <IconButton onClick={onOptions}>
            <MoreVert/>
        </IconButton>}
    </ListItem>
);

SongListItem.propTypes = {
    onMouseLeave: PropTypes.func.isRequired,
    onClick: PropTypes.func.isRequired,
    item: PropTypes.object.isRequired
};

SongListItem.defaultProps = {};

export default React.memo(SongListItem);
