import endPoints from "../api/EndPoints/EndPoints";
import {storageIndex} from "./Helper/StorageIndex";
import {get, set} from "idb-keyval";
import {DebugLog} from "./Log";
import {Cookies} from "./Cookies";
import {comLinkWorker} from "./Worker/worker-export";

export const initAuth = async () => {
    let token = Cookies.getCookie(storageIndex.cookies.Tokens);
    if (!token) {
        window.location.href = endPoints.authRedirect;
        return new Error("Failed to Auth, Redirecting");
    }

    token = JSON.parse(token);
    if (Math.floor(((Date.now() - token.exp) / 1000) / 60) > 120) { // Two Hours
        return await fetch(endPoints.refreshToken, {
            credentials: "include"
        }, 5000).then(res => res.ok ? res.json() : null).then(r => r.access_token);
    } // Expired
    return token.access_token; // Return Token
};

(async () => {
    try {
        if (!Cookies.getCookie(storageIndex.cookies.UserData)) return window.location.href = endPoints.authRedirect;
        const stored = await get(storageIndex.cookies.UserData);
        if (!stored) await set(storageIndex.cookies.UserData, await comLinkWorker.JSON.parse(Cookies.getCookie(storageIndex.cookies.UserData)));
        else window.__kn.music["data-collection"].token = await fetch(endPoints.DataCollection.getToken, {
            method: "post",
            headers: {
                'Authorization': `Bearer ${await initAuth()}`
            }
        }).then(a => a.json());
    } catch (e) {
        DebugLog(e);
    }
    //    Everything is fine joe
})();
