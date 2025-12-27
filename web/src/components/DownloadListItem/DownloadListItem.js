import React from "react";
import "./DownloadListItem.css";
import ListItem from "@material-ui/core/ListItem";
import ListItemAvatar from "@material-ui/core/ListItemAvatar";
import Avatar from "@material-ui/core/Avatar";
import ListItemText from "@material-ui/core/ListItemText";
import Typography from "@material-ui/core/Typography";
import { makeStyles } from "@mui/styles";

const useStyles = makeStyles((theme) => ({
	inline: {
		display: "inline",
	},
}));
const DownloadListItem = (props) => {

	const classes = useStyles();
	return (
		<ListItem button alignItems="flex-start" onClick={props.onClick}>
			<ListItemAvatar>
				<Avatar alt={props.title} src={props.thumbnail}/>
			</ListItemAvatar>
			<ListItemText
				primary={props.title}
				secondary={
					<React.Fragment>
						<Typography
							component="span"
							variant="body2"
							className={classes.inline}
							color="textPrimary"
						>
							{props.channelTitle}
						</Typography>
					</React.Fragment>
				}
			/>
		</ListItem>
	);
};

DownloadListItem.propTypes = {};

DownloadListItem.defaultProps = {};

export default React.memo(DownloadListItem);
