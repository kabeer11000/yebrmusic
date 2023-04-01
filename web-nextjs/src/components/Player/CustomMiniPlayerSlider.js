import React, {useEffect} from "react";
import Slider from "@material-ui/core/Slider";
import {PlayContext} from "../../Contexts";

const CustomMiniPlayerSlider = () => {
	const {playState} = React.useContext(PlayContext);
	const [scrubbing, setScrubbing] = React.useState(playState.audioElement.currentTime || 0);

	useEffect(() => {
		playState.audioElement.ontimeupdate = () => setScrubbing(playState.audioElement.currentTime);
		return () => {
			playState.audioElement.ontimeupdate = null;
		};
	}, []);

	const handleScrubbing = (i, v) => {
		if (!isFinite(v)) return;
		setScrubbing(v);
		playState.audioElement.currentTime = v;
	};

	return <Slider
		className={"p-0 m-0"}
		defaultValue={0}
		value={scrubbing}
		min={0.0}
		color={"primary"}
		max={playState.audioElement.duration}
		onChange={handleScrubbing}
	/>;
};
export default React.memo(CustomMiniPlayerSlider);
