import React from "react";
import "./SongCard.css";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardMedia from "@material-ui/core/CardMedia";
import CardContent from "@material-ui/core/CardContent";
import {IconButton, Typography} from "@material-ui/core";
// import Grow from "@material-ui/core/Grow";
// import {FocusNode} from "@please/lrud";
import ListItemText from "@material-ui/core/ListItemText";
import PropTypes from "prop-types";
import {QueueMusic} from "@material-ui/icons";

const SongCard = ({song, ...props}) => (
	<>
		{/*<Grow in={true}>*/}
		<Card className={"SongCard"} disableRipple style={{width: "18rem", backgroundColor: "transparent"}}
			  elevation={0}
			  {...props}>
			{/*<FocusNode>*/}
			<CardActionArea>
				<Card>
					<CardMedia
						component={"img"}
						alt={song.snippet.title}
						height="140"
						onError={(e) => {
							e.target.onerror = null;
							e.target.src = "./assets/icons/darkmode_nothingfound.svg";
						}}
						image={song.snippet.thumbnails.high.url}
						title={song.snippet.title}
						loading={"lazy"}
					/>
				</Card>
				<div hidden={!props.playlist} style={{
					position: "absolute",
					backgroundColor: "#000000",
					opacity: "30%",
					height: "100%",
					width: "100%",
					top: 0,
					display: !props.playlist ? "none" : "block"
				}}/>
				<IconButton color={"#FFFFFF"} hidden={!props.playlist} style={{
					position: "absolute",
					bottom: "0.5rem",
					right: "0.5rem",
					display: !props.playlist ? "none" : "block"
				}}>
					<QueueMusic style={{color: "#FFF"}}/>
				</IconButton>
			</CardActionArea>
			<CardContent className={"text-left mb-0 pb-0"} style={{
				marginLeft: "-1rem"
			}}>
				<Typography gutterBottom variant="h6" component="p" className={"text-truncate"}>
					<ListItemText
						primary={<div className={"text-truncate"}>{song.snippet.title}</div>}
						secondary={song.snippet.channelTitle}/>
				</Typography>
			</CardContent>
			{/*</FocusNode>*/}
		</Card>
		{/*</Grow>*/}
	</>
);

SongCard.propTypes = {
	song: PropTypes.object.isRequired,
	onClick: PropTypes.func.isRequired,
	playlist: PropTypes.any
};

SongCard.defaultProps = {};

export default React.memo(SongCard);
