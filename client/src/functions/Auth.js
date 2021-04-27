import endPoints from "../api/EndPoints/EndPoints";
import {storageIndex} from "./Helper/StorageIndex";
import {get, set} from "idb-keyval";
import {DebugLog} from "./Log";
import {Cookies} from "./Cookies";
import {comLinkWorker} from "./Worker/worker-export";

export const initAuth = async () => {
    let tokens = Cookies.getCookie(storageIndex.cookies.Tokens);
    if (!tokens) {
        window.location.href = endPoints.authRedirect;
        return new Error("Failed to Auth, Redirecting");
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
        const access_token = await comLinkWorker.JSON.parse(atob((await comLinkWorker.JSON.parse(Cookies.getCookie(storageIndex.cookies.Tokens))).access_token.split(".")[1]));
        if (access_token.iat > access_token.exp) {
            window.location.href = endPoints.Auth.refreshToken({redirect_uri: window.location.href});
        }
    } catch (e) {
        DebugLog(e);
    }
    //    Everything is fine joe
})();
