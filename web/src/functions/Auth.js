import endPoints from "../api/EndPoints/EndPoints";
import {storageIndex} from "./Helper/StorageIndex";
import {get, set} from "idb-keyval";
import Log from "./Log";
import {Cookies} from "./Cookies";


export const GetActiveAccounts = async () => {
	const accounts = await fetch("https://cdn.jsdelivr.net/gh/kabeer11000/docs-hosted@yebrmusic-assets/accounts.json", {
		// credentials: "include"
	}).then(a => a.status === 200 ? a.json() : []).catch();
	return {active: accounts.filter(account => account.signed_in), all: accounts};
};
export const ServiceLoginRequest = (u) => fetch("http://localhost:9000/auth/service-login/browse/key", {
	credentials: "include",
	method: "post",
	headers: {authuser: u}
}).then(response => response.status === 200 ? response.json() : null).catch(() => ({}));

export const AuthOnLoad = async () => {
	if (navigator.onLine) {
		await GetActiveAccounts(); // Try Catch
		const user = parseInt(new URLSearchParams(window.location.search).get(storageIndex.AuthUserParam));
		if (!window.__kn.music.accounts.active.length) {
			window.__kn.music.internals.auth_redirecting = true;
			window.location.href = endPoints.authRedirect;
			return;
		}
		window.__kn.music.user = window.__kn.music.accounts.active[user || 0];
		await set(storageIndex.cookies.UserData, window.__kn.music.user);
		if (!Cookies.getCookie(storageIndex.cookies.ServiceLoginToken)) await ServiceLoginRequest();
	} else {
		window.__kn.music.user = await get(storageIndex.cookies.UserData);
		/**
		 * Service Login Token saved in cookie will probably be expired. but definitely issued to same account
		 */
	}
	Log(`Signed In to Yebr as: ${window.__kn.music.user.username}`);
};
// export const ActiveAccounts = new AsyncResource(GetActiveAccounts());
// export const ServiceLoginToken = ServiceLoginRequest(parseInt(new URLSearchParams(window.location.search).get(storageIndex.AuthUserParam)) || 0);
export const initAuth = async () => {
	const ServiceLoginToken = Cookies.getCookie(storageIndex.cookies.ServiceLoginToken);
	// console.log(window.__kn.music.serviceLoginToken)
	// let tokens = Cookies.getCookie(storageIndex.cookies.Tokens); // Tokens Cookie
	// const refreshToken = Cookies.getCookie(storageIndex.cookies.RefreshToken); // Refresh Token cookie

	/** if refreshing or redirecting return null **/
	if (window.__kn.music.internals.auth_redirecting || window.__kn.music.internals.auth_refreshing) return new Error("Redirecting or Refreshing");

	/** If not curently redirecting, redirect **/
	if (!window.__kn.music.serviceLoginToken && !window.__kn.music.internals.auth_redirecting) {
		// window.__kn.music.internals.auth_redirecting = true
		// window.location.href = endPoints.authRedirect;
		return new Error("Failed to Auth, Redirecting");
	}
	/** if not currently redirecting, redirect **/
	// if (!tokens && !refreshToken && !window.__kn.music.internals.auth_redirecting) {
	// window.__kn.music.internals.auth_redirecting = true
	// window.location.href = endPoints.authRedirect;
	// return new Error("Failed to Auth, Redirecting");
	// }
	/** if access_token expired, and not currently refreshing **/
	// if (!tokens && refreshToken && !window.__kn.music.internals.auth_refreshing) {
	// window.location.href = endPoints.Auth.refreshToken({redirect_uri: window.location.href});
	// window.__kn.music.internals.auth_refreshing = true
	// }
	// const access_token = await comLinkWorker.JSON.parse(atob((await comLinkWorker.JSON.parse(tokens)).access_token.split(".")[1]));
	// if (access_token.iat > access_token.exp) {
	// console.log("PORN")
	// window.location.href = endPoints.Auth.refreshToken({redirect_uri: window.location.href});
	// }
	return window.__kn.music.serviceLoginToken; // Return Token

};
// (async () => AuthOnLoad())();
// document.addEventListener("onload", AuthOnLoad);
/*
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
*/
