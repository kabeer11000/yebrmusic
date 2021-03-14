import React from "react";
import "./SongCard2.css";
import Grow from "@material-ui/core/Grow";
import Card from "@material-ui/core/Card";
import {FocusNode} from "@please/lrud";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardMedia from "@material-ui/core/CardMedia";
import CardContent from "@material-ui/core/CardContent";
import {IconButton, Typography} from "@material-ui/core";
import ListItemText from "@material-ui/core/ListItemText";
import Paper from "@material-ui/core/Paper";
import {QueueMusic} from "@material-ui/icons";

const SongCard2 = (props) => {
	const video_ = props.video.snippet;
	const unEntity = (str) => str.replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">");

	return (
		<Grow in={true}>
			<Card className={"SongCard"} disableRipple
				  style={{
					  width: "100%", backgroundColor: "transparent", /*maxWidth: "12rem"*/
					  maxWidth: "auto",
				  }}
				  elevation={0}
				  onClick={props.onPlay}>
				<FocusNode>
					<CardActionArea>
						<Card className={"py-0 my-0"}>
							<Paper>
								<CardMedia
									component={"img"}
									alt={video_.title}
									style={{
										height: "100%",
										width: "100%",
										maxHeight: "auto",
										maxWidth: "auto",
										objectFit: "cover"
										// resize:"both",
										// objectFit: "contain"
										// maxWidth: "12rem",
										// maxHeight: "12rem",
									}}
									onError={(e) => {
										e.target.onerror = null;
										e.target.src = `./assets/icons/darkmode_nothingfound.svg`
									}}
									image={props.thumbnail || video_.thumbnails.high.url}
									title={unEntity(video_.title)}
									loading={"lazy"}
								/>
							</Paper>
						</Card>
						<div hidden={props.playlist ? false : true} style={{
							position: 'absolute',
							backgroundColor: "#000000",
							opacity: "30%",
							height: "100%",
							width: "100%",
							top: 0
						}}/>
						<IconButton hidden={props.playlist ? false : true} style={{
							position: 'absolute',
							bottom: "0.5rem",
							right: "0.5rem",
						}}>
							<QueueMusic/>
						</IconButton>
					</CardActionArea>
					<CardContent className={"text-left pt-0"} style={{
						marginLeft: "-1rem",
					}}>
						<Typography gutterBottom variant="h6" component="p" className={"text-truncate"}>
							<ListItemText
								primary={<div className={"text-truncate"}>{video_.title.slice(0, 70) + " ..."}</div>}
								secondary={video_.channelTitle}/>
							{/*{video_.title.slice(0, 70) + " ..."}*/}
						</Typography>
						{/*<Typography variant="body2" color="textSecondary" style={{textDecoration: "none"}}*/}
						{/*			component={Link} to={`/artist?id=${video_.channelId}`}*/}
						{/*			className={"text-truncate"}>*/}
						{/*	/!*{video_.description ? video_.description.slice(0, 70) + " ..." : ""}*!/*/}
						{/*	<span className={"text-muted text-truncate"}>*/}
						{/*		{video_.channelTitle}*/}
						{/*	</span>*/}
						{/*</Typography>*/}
					</CardContent>
				</FocusNode>
			</Card>
		</Grow>
	);
};
SongCard2.propTypes = {};

SongCard2.defaultProps = {};

export default SongCard2;
