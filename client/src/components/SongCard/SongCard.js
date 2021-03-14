import React from "react";
import "./SongCard.css";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardMedia from "@material-ui/core/CardMedia";
import CardContent from "@material-ui/core/CardContent";
import {Typography} from "@material-ui/core";
import Grow from "@material-ui/core/Grow";
import {FocusNode} from "@please/lrud";
import ListItemText from "@material-ui/core/ListItemText";
import PropTypes from 'prop-types';

const SongCard = ({song, ...props}) => (
    <Grow in={true}>
        <Card className={"SongCard"} disableRipple style={{width: "18rem", backgroundColor: "transparent"}}
              elevation={0}
              {...props}>
            <FocusNode>
                <CardActionArea>
                    <Card>
                        <CardMedia
                            component={"img"}
                            alt={song.snippet.title}
                            height="140"
                            onError={(e) => {
                                e.target.onerror = null;
                                e.target.src = `./assets/icons/darkmode_nothingfound.svg`
                            }}
                            image={song.snippet.thumbnails.high.url}
                            title={song.snippet.title}
                            loading={"lazy"}
                        />
                    </Card>
                </CardActionArea>
                <CardContent className={"text-left mb-0 pb-0"} style={{
                    marginLeft: "-1rem"
                }}>
                    <Typography gutterBottom variant="h6" component="p" className={"text-truncate"}>
                        <ListItemText
                            primary={song.snippet.title} secondary={song.snippet.channelTitle}/>
                    </Typography>
                </CardContent>
            </FocusNode>
        </Card>
    </Grow>
);

SongCard.propTypes = {
    song: PropTypes.object.isRequired,
    onClick: PropTypes.func.isRequired
};

SongCard.defaultProps = {};

export default React.memo(SongCard);
