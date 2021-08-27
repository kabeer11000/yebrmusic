import React from "react";
import ListItem from "@material-ui/core/ListItem";
import ListItemAvatar from "@material-ui/core/ListItemAvatar";
import Avatar from "@material-ui/core/Avatar";
import ListItemText from "@material-ui/core/ListItemText";
import Typography from "@material-ui/core/Typography";
import makeStyles from "@material-ui/core/styles/makeStyles";
import Chip from "@material-ui/core/Chip";
import IconButton from "@material-ui/core/IconButton";
import {MoreVert} from "@material-ui/icons";
import PropTypes from "prop-types";
import Divider from "@material-ui/core/Divider";

const useStyles = makeStyles(() => ({
	inline: {
		display: "inline",
	},
}));
const SongListItem = ({song, onClick, onOptions}) => {

	const classes = useStyles();
	return (
		<React.Fragment>
			<ListItem button alignItems="flex-start">
				<React.Fragment>
					<ListItemAvatar onClick={onClick}>
						<Avatar alt={song.videoElement.snippet.title}
								src={song.videoElement.snippet.thumbnails.high.url}/>
					</ListItemAvatar>
					<ListItemText
						className={"text-truncate"}
						primary={song.videoElement.snippet.title}
						onClick={onClick}
						secondary={
							<React.Fragment>
								<Typography
									component="span"
									variant="body2"
									className={`${classes.inline} text-truncate`}
									color="textPrimary">
									<div className={"text-truncate"}>{song.videoElement.snippet.channelTitle}</div>
								</Typography>
								{
									song.tags && song.tags.length ? <div className={"cardSlider Slider"}>
										{song.tags.map((v, i) => <Chip className={"mx-1"} key={i}
																	   label={v}/>)}
									</div> : null
								}
							</React.Fragment>
						}
					/>
				</React.Fragment>
				<IconButton onClick={onOptions}>
					<MoreVert/>
				</IconButton>
			</ListItem>
			<Divider variant="inset" component="li"/>
		</React.Fragment>
	);
};

SongListItem.propTypes = {
	onMouseLeave: PropTypes.func.isRequired,
	onClick: PropTypes.func.isRequired,
	song: PropTypes.object.isRequired
};

SongListItem.defaultProps = {};

export default React.memo(SongListItem);
