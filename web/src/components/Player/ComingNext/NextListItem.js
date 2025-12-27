import React from "react";
import ListItem from "@material-ui/core/ListItem";
import ListItemAvatar from "@material-ui/core/ListItemAvatar";
import Avatar from "@material-ui/core/Avatar";
import ListItemText from "@material-ui/core/ListItemText";
import { makeStyles } from "@mui/styles";
import {pure} from "recompose";

const useStyles = makeStyles((theme) => ({
	inline: {
		display: "inline",
	},
}));
const NextListItem = (props) => {

	const classes = useStyles();
	return (
		<ListItem button disabled={props.currentIndex === props.keyIndex} alignItems="flex-start"
				  selected={props.currentIndex === props.keyIndex} className={"p-0 px-1"}
				  onClick={props.onClick}>
			<ListItemAvatar>
                <Avatar imgProps={{
                    loading: "lazy"
                }} variant="rounded" alt={props.title} src={props.image}/>
            </ListItemAvatar>
            <ListItemText
				primary={<div>{props.title}</div>}
				secondary={<div
					// component="span"
					// variant="body2"
					color="textPrimary">{props.channelTitle}</div>}
            />
		</ListItem>);
};

NextListItem.propTypes = {};

NextListItem.defaultProps = {};

export default pure(NextListItem);
