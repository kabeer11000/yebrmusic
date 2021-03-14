import React from "react";
import "./ComingNext.css";
import AccordionDetails from "@material-ui/core/AccordionDetails";
import NextListItem from "./NextListItem";
import List from "@material-ui/core/List";
import ListSubheader from "@material-ui/core/ListSubheader";
import {PlayContext} from "../../../Contexts";
import PropTypes from "prop-types";

const ComingNext = (props) => {
    const {playState} = React.useContext(PlayContext);
    return (
        <AccordionDetails className={"ComingNext"} style={{/*maxHeight: "90vh", overflowY: "hidden"*/}}>
            <List className={"text-truncate"} style={{/*maxHeight: "85vh",*/ overflowY: "hidden"}}
                  subheader={
                      <ListSubheader component="div" style={{backgroundColor: "primary.main"}} className={"mx-0 px-0"}
                                     id="nested-list-subheader">
                          Coming Up Next
                      </ListSubheader>
                  }>
                {
                    playState.playList ? playState.playList.list.items.map((value, index) => <NextListItem
                            onClick={() => props.PlaySong(value, index)} currentIndex={index}
                            keyIndex={playState.playList.index} key={index}
                            title={value.isOffline ? value.videoElement.snippet.title : value.snippet.title}
                            channelTitle={value.isOffline ? value.videoElement.snippet.channelTitle : value.snippet.channelTitle}
                            image={value.isOffline ? value.videoElement.snippet.thumbnails.high.url : value.snippet.thumbnails.high.url}/>) :
                        <NextListItem onClick={() => {
                            // props.playSong({video: value, index: index});
                        }} currentIndex={0} keyIndex={0} title={playState.videoElement.snippet.title}
                                      channelTitle={playState.videoElement.snippet.channelTitle}
                                      image={playState.videoElement.snippet.thumbnails.high.url}/>
                }
            </List>
        </AccordionDetails>
    );
};

ComingNext.propTypes = {
    PlaySong: PropTypes.func.isRequired
};
ComingNext.defaultProps = {};
export default React.memo(ComingNext);

