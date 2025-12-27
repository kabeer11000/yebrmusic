/* eslint-disable */
import "preact/debug";
import React from "react";
import { hydrate, render } from "react-dom";
import "./index.css";
import App from "./App";
import * as serviceWorker from "./serviceWorker";
import { IsTvProvider } from "./Contexts";
import { storageIndex } from "./functions/Helper/StorageIndex";
import { RetrievalDeleteLS } from "./functions/Helper/RetrievalDeleteLS";
import { Cookies } from "./functions/Cookies";
// import "https://cdn.jsdelivr.net/npm/clientjs/dist/client.min.js";

if (!window.__kn.music.developers["debugging-enabled"]) {
    if (localStorage.getItem(storageIndex.litemode)) localStorage.setItem(storageIndex.litemode, "true");
    console.log = () => {
    };
}
window.addEventListener("beforeunload", async (e) => {
    // TODO Temporarily diabled beforeunloads
    // e.preventDefault();
    // await RetrievalDeleteLS.set(storageIndex.cookies.AuthUser, window.__kn.music.auth.authUser);

    // const params = new URLSearchParams(window.location.search);
    // params.set("u", window.__kn.music.auth.authUser);
    // const newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + "?" + params.toString();
    // window.history.replaceState({ path: newurl }, "", newurl);
    // window.location.href = "https://google.com"
    // alert(params.toString())
    // window.location.search = params.toString()
});
/*
const consolere = {
    channel: 'yebrmusic',
    api: '//console.re/connector.js',
    ready: function () {
        const _this = this;
        return new Promise(async (resolve, reject) => {
            const s = document.createElement('script');
            s.src = _this.api;
            s.id = 'consolerescript';
            s.onload = resolve;
            s.onerror = reject;
            document.getElementsByTagName('head')[0].appendChild(s);
        })
    }
};
consolere.ready().then(() => console.re.log('remote log test'));

 */
// window.__kn.music.audio.crossOrigin = "anonymous";

// const AudioContext = window.AudioContext || window.webkitAudioContext;
// const audioCtx = new AudioContext();
// const track = audioCtx.createMediaElementSource(window.__kn.music.audio);
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
//     window.__kn.music.audio.play();
// }
// clearInterval(interval); // thanks @Luca D'Amico
// window.__kn.music.audio.setAttribute("id", "MainAudio-KabeersMusic")
// window.kmusic = {};

if (localStorage.getItem("3d-sound") !== null) {
    const AudioContext = window.AudioContext || window["webkitAudioContext"];
    window.__kn.music.audioContext = new AudioContext();
    window.__kn.music.track = window.__kn.music.audioContext.createMediaElementSource(window.__kn.music.audio);
}

const rootElement = document.querySelector("app-renderer");
if (rootElement.hasChildNodes()) hydrate(<IsTvProvider><App /></IsTvProvider>, rootElement);
else render(<IsTvProvider><App /></IsTvProvider>, rootElement);

// This function is called from index.html, ClientJS library's onLoad method
// Set's users deviceId, do not remove

// Serialized functionset for ClientJS, 
// this is not initialized anywhere except in feedback dialog.

// This code is responible for populating the device ID / fingerprint variable
// While the function is used here, it is defined in index.js file to use the module bundler
// for StorageIndex structs

(function () {
    const s = document.createElement("script");
    s.src = "https://cdn.jsdelivr.net/npm/clientjs/dist/client.min.js";
    s.onload = () => {
        if (Cookies.getCookie(storageIndex.cookies.deviceID)) return;
        const fp = new window.ClientJS().getFingerprint();
        console.log('index.js: [$__kn_yebr_fpload] saved fingerprint: ' + fp);
        Cookies.setCookie(storageIndex.cookies.deviceID, fp, 400);
        s.remove();
        return;
    }
    document.head.append(s);
}());

// render(<IsTvProvider><App/></IsTvProvider>, document.querySelector("app-renderer"));
// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.register();
