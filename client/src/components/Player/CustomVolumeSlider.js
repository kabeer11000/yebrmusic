import React from "react";
import Slider from "@material-ui/core/Slider";
import {PlayContext} from "../../Contexts";

const CustomSlider = () => {
	const {playState} = React.useContext(PlayContext);
	const [scrubbing, setScrubbing] = React.useState(playState.audioElement.volume * 100);

	const handleScrubbing = (i, v) => {
		setScrubbing(v);
		playState.audioElement.volume = v / 100;
	};

	React.useEffect(() => {
		playState.audioElement.onvolumechange = () => setScrubbing(playState.audioElement.volume * 100);
		return () => {
			playState.audioElement.onvolumechange = null;
		};
	}, []);
	return (
		<Slider
			className={"container -PlayerSlider"}
			defaultValue={scrubbing}
			value={scrubbing}
			min={0.0}
			max={100}
			onChange={handleScrubbing}
		/>
	);
};

export default React.memo(CustomSlider);
