import React, {useEffect} from "react";
import Slider from "@material-ui/core/Slider";
import {PlayContext} from "../../Contexts";
import Grid from "@material-ui/core/Grid";

function toHHMMSS(seconds) {
	const date = new Date(1970, 0, 1);
	date.setSeconds(seconds);
	return date.toTimeString().replace(/.*(\d{2}:\d{2}:\d{2}).*/, "$1");
}
const CustomSlider = (props) => {
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

	return props.mobile ? <Slider
		className={"-container -PlayerSlider"}
		defaultValue={0}
		value={scrubbing}
		min={0.0}
		color={"primary.player.slider"}
		max={playState.audioElement.duration}
		onChange={handleScrubbing}
		{...props}
	/> : <React.Fragment>
		<Grid item lg={1} md={1} xl={1} className={"text-left"}>
			{toHHMMSS(scrubbing)}
		</Grid>
		<Grid item lg={10} md={10} xl={10}>
			<Slider
				className={"-container -PlayerSlider"}
				defaultValue={0}
				value={scrubbing}
				min={0.0}
				color={"primary.player.slider"}
				max={playState.audioElement.duration}
				onChange={handleScrubbing}
				style={{
					width: "100%",
					flex: "1 1 auto"
				}}
				{...props}
			/>
		</Grid>
		<Grid item lg={1} md={1} xl={1} className={"text-right"}>
			{toHHMMSS(playState.audioElement.duration || 0)}
		</Grid>
	</React.Fragment>;
	// return <Slider
	// 	className={"-container -PlayerSlider"}
	// 	defaultValue={0}
	// 	value={scrubbing}
	// 	min={0.0}
	// 	color={"primary.player.slider"}
	// 	max={playState.audioElement.duration}
	// 	onChange={handleScrubbing}
	// 	{...props}
	// />;
};

export default React.memo(CustomSlider);
