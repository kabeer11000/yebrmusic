import React from "react";
import ReactDOM from "react-dom";
import Drawer from "./Drawer";

it("It should mount", () => {
	const div = document.createElement("div");
	ReactDOM.render(<Drawer/>, div);
	ReactDOM.unmountComponentAtNode(div);
});
