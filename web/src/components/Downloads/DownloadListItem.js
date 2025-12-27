import React from "react";
import ListItem from "@material-ui/core/ListItem";
import ListItemAvatar from "@material-ui/core/ListItemAvatar";
import Avatar from "@material-ui/core/Avatar";
import ListItemText from "@material-ui/core/ListItemText";
import { makeStyles } from "@mui/styles";
import Chip from "@material-ui/core/Chip";
import IconButton from "@material-ui/core/IconButton";
import {Delete} from "@material-ui/icons";
import PropTypes from "prop-types";
import Divider from "@material-ui/core/Divider";

const useStyles = makeStyles(() => ({
	inline: {
		display: "inline",
	},
}));
const DownloadListItem = ({song, onClick, onMouseLeave}) => {

	const classes = useStyles();
	return (
		<React.Fragment>
			<ListItem button alignItems="flex-start" className={"mx-0 px-2 rounded"}>
                <React.Fragment>
                    <ListItemAvatar onClick={onClick}>
                        <Avatar variant="rounded" alt={song.videoElement.snippet.title}
                                src={song.videoElement.snippet.thumbnails.high.url}/>
                    </ListItemAvatar>
                    <ListItemText
                        primary={<div>{song.videoElement.snippet.title}</div>}
                        onClick={onClick}
                        secondary={
                            <React.Fragment>
                                <div>
                                    {song.videoElement.snippet.channelTitle}
                                </div>
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
				<IconButton onClick={onMouseLeave}>
					<Delete/>
				</IconButton>
			</ListItem>
            {/*<Divider variant="inset" component="li"/>*/}
		</React.Fragment>
	);
};

DownloadListItem.propTypes = {
	onMouseLeave: PropTypes.func.isRequired,
	onClick: PropTypes.func.isRequired,
	song: PropTypes.object.isRequired
};

DownloadListItem.defaultProps = {};

export default React.memo(DownloadListItem);
