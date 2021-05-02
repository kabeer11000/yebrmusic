import endPoints from "../api/EndPoints/EndPoints";
import {storageIndex} from "./Helper/StorageIndex";
import {get, set} from "idb-keyval";
import {DebugLog} from "./Log";
import {Cookies} from "./Cookies";
import {comLinkWorker} from "./Worker/worker-export";
// import ReactGA from "react-ga";


export const initAuth = async () => {
    let tokens = Cookies.getCookie(storageIndex.cookies.Tokens); // Tokens Cookie
    const refreshToken = Cookies.getCookie(storageIndex.cookies.RefreshToken); // Refresh Token cookie

    /** if refreshing or redirecting return null **/
    if (window.__kn.music.internals.auth_redirecting || window.__kn.music.internals.auth_refreshing) return new Error("Redirecting or Refreshing");

    /** if not currently redirecting, redirect **/
    if (!tokens && !refreshToken && !window.__kn.music.internals.auth_redirecting) {
        window.__kn.music.internals.auth_redirecting = true
        window.location.href = endPoints.authRedirect;
        return new Error("Failed to Auth, Redirecting");
    }
    /** if access_token expired, and not currently refreshing **/
    if (!tokens && refreshToken && !window.__kn.music.internals.auth_refreshing) {
        window.location.href = endPoints.Auth.refreshToken({redirect_uri: window.location.href});
        window.__kn.music.internals.auth_refreshing = true
    }
    // const access_token = await comLinkWorker.JSON.parse(atob((await comLinkWorker.JSON.parse(tokens)).access_token.split(".")[1]));
    // if (access_token.iat > access_token.exp) {
    // console.log("PORN")
    // window.location.href = endPoints.Auth.refreshToken({redirect_uri: window.location.href});
    // }
    return JSON.parse(tokens).access_token; // Return Token

};

(async () => {
    try {
        if (!Cookies.getCookie(storageIndex.cookies.UserData)) return window.location.href = endPoints.authRedirect;
        const stored = await get(storageIndex.cookies.UserData);
        if (!stored) await set(storageIndex.cookies.UserData, await comLinkWorker.JSON.parse(Cookies.getCookie(storageIndex.cookies.UserData)));
        else window.__kn.music["data-collection"].token = await comLinkWorker.fetch(endPoints.DataCollection.getToken, {
            method: "post",
            headers: {
                'Authorization': `Bearer ${await initAuth()}`
            }
        });
        if (!navigator.onLine) return;
        const tokens = Cookies.getCookie(storageIndex.cookies.Tokens);
        const refreshToken = Cookies.getCookie(storageIndex.cookies.RefreshToken)
        if (!tokens && refreshToken) {
            window.__kn.music.internals.auth_refreshing = true
            return window.location.href = endPoints.Auth.refreshToken({redirect_uri: window.location.href});
        }
        // await ReactGA.initialize(storageIndex.GA);
        // await ReactGA.set({
        //     userId: (await get(storageIndex.cookies.UserData)).user_id,
        // });

    } catch (e) {
        DebugLog(e);
    }
    //    Everything is fine joe
})();
