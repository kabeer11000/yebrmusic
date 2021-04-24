import React from "react";
import Grow from "@material-ui/core/Grow";
// import {FocusNode} from "@please/lrud";
import ButtonBase from "@material-ui/core/ButtonBase";
import Preloader from "../../Preloader/Preloader.lazy";
import PropTypes from "prop-types";
import {isTvContext, LoadingContext, PlayContext} from "../../../Contexts";

const CommingNextImagesSlider = (props) => {
    const {playState} = React.useContext(PlayContext);
    const tv = React.useContext(isTvContext);
    const loading = React.useContext(LoadingContext);
    const scrollRef = React.useRef(null);
    const Song = playState.others.offline ? playState.videoElement.videoElement : playState.videoElement;

    React.useEffect(() => {
        if (Song) scrollRef.current.scrollIntoView({behavior: 'smooth', block: 'center'});
    }, [playState.videoElement]);
    return (
        <div className={`cardSlider text-left Slider ${!tv ? "mb-0 py-0 pb-3" : "py-0 my-0"}`}
             style={{scrollSnapType: "both mandatory"}}>
            {
                !playState.playList ? <Grow in={true}>
                        <ButtonBase ref={scrollRef}>
                            <img src={Song.snippet.thumbnails.high.url}
                                 className={`image mb-0 mx-3 img-fluid rounded shadow SongNextSliderSelected`}
                                 onError={(e) => {
                                     e.target.onerror = null;
                                     e.target.src = "https://cdn.jsdelivr.net/gh/kabeer11000/docs-hosted@yebrmusic-assets/broken_image_black_24dp.svg"
                                 }}
                                 style={{
                                     scrollSnapAlign: "center",
                                     marginTop: "0",
                                     width: tv ? "17rem" : "15rem",
                                     height: tv ? "17rem" : "15rem",
                                     border: "white solid 0.1rem"
                                 }} alt={Song.snippet.title}/>
                        </ButtonBase>
                    </Grow>
                    : playState.playList.list.items.map((value, index) =>
                        <Grow in={true} key={index} ref={index === playState.playList.index ? scrollRef : null}>
                            <div className={"ImageSliderIMG"}>
                                <ButtonBase>
                                    <img
                                        src={playState.others.offline ? value.videoElement.snippet.thumbnails.high.url : value.snippet.thumbnails.high.url}
                                        className={`image mb-0 mx-3 img-fluid rounded shadow ${index === playState.playList.index ? "SongNextSliderSelected" : ""}`}
                                        onError={(e) => {
                                            e.target.onerror = null;
                                            e.target.src = "https://cdn.jsdelivr.net/gh/kabeer11000/docs-hosted@yebrmusic-assets/broken_image_black_24dp.svg"
                                        }}
                                        onClick={() => index === playState.playList.index ? null : props.PlaySong(value, index)}
                                        style={{
                                            scrollSnapAlign: "center",
                                            marginTop: "0",
                                            width: index === playState.playList.index && tv ? "17rem" : "15rem",
                                            height: index === playState.playList.index && tv ? "17rem" : "15rem",
                                            border: index === playState.playList.index ? "white solid 0.1rem" : null
                                        }}
                                        alt={playState.others.offline ? value.videoElement.snippet.title : value.snippet.title}/>
                                </ButtonBase>
                            </div>
                        </Grow>
                    )
            }
            {!loading ?
                <div style={{zIndex: 10}}>
                    <Preloader/>
                </div> : null
            }
        </div>
    );
};

CommingNextImagesSlider.propTypes = {
    PlaySong: PropTypes.func.isRequired
};
CommingNextImagesSlider.defaultProps = {};

export default React.memo(CommingNextImagesSlider);

