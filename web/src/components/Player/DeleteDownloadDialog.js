import {Avatar} from "@material-ui/core";
import React from "react";
import Strings from "../../Strings";

export const DialogBody = ({Song}) => (
	<div className={"k-dialog-body-inner"}>
		<div className={"d-flex justify-content-center mb-3"}>
			<Avatar variant={"rounded"} style={{
				width: "100%",
				height: "auto"
			}} src={Song.snippet.thumbnails.high.url} alt={"Song Thumbnail"}/>
		</div>
		{Strings["Utils:Downloads:DeleteDownload.Body"](Song)}
	</div> || Strings["Utils:NothingHere"]
);
