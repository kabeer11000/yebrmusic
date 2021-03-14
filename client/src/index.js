/* eslint-disable */
import React from "react";
import ReactDOM from "react-dom";

import "./index.css";
import App from "./App";
import * as serviceWorker from "./serviceWorker";
import {IsTvProvider} from "./Contexts";

console.error = () => {
};
if (process.env.NODE_ENV !== "development") {
    serviceWorker.register();
    console.log = () => {
    };
}
window.audio = new Audio("#");
// window.audio.crossOrigin = "anonymous";

// const AudioContext = window.AudioContext || window.webkitAudioContext;
// const audioCtx = new AudioContext();
// const track = audioCtx.createMediaElementSource(window.audio);
// const pannerOptions = {pan: 0};
// const panner = new StereoPannerNode(audioCtx, pannerOptions);
// track.connect(panner).connect(audioCtx.destination);
// let direction = 10;
// let i = 0
// const interval = setInterval(async function () {
//     /*
//     if (i === 100) {
//         return  -10;
//     } else if (i === 0) {
//         return 10;
//     } else return direction
//     */
//
//     direction = i === 100 ? -10 : i === 0 ? 10 : direction;
//     i += direction;
//     panner.pan.value = i / 100;
//     // console.log(direction, i, i / 100)
// // method to be executed;
// }, /*60*/ 1000);
// window.play = () => {
//     if (audioCtx.state === 'suspended') {
//         audioCtx.resume();
//     }
//     window.audio.play();
// }
// clearInterval(interval); // thanks @Luca D'Amico
// window.audio.setAttribute("id", "MainAudio-KabeersMusic")
window.kmusic = {};
if (localStorage.getItem("3d-sound") !== null) {
    const AudioContext = window.AudioContext || window.webkitAudioContext;
    window.kmusic.audioContext = new AudioContext();
    window.kmusic.track = window.kmusic.audioContext.createMediaElementSource(window.audio);
}
ReactDOM.render(
    <IsTvProvider><App/></IsTvProvider>,
    document.getElementById("root")
);
// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.register();
