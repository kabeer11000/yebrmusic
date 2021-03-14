import endPoints from "../api/endpoints/endpoints";
import fetch from "./fetchWithTimeOut";
import {storageIndex} from "./Helper/storageIndex";
//import {registerDeviceCast} from "./Cast/Cast";
import AfterAuthFunctions from "./afterAuth";
import {get, set} from "idb-keyval";

const cookies = {
	getCookie(e) {
		for (let t = e + "=", o = decodeURIComponent(document.cookie).split(";"), n = 0; n < o.length; n++) {
			for (var r = o[n]; " " === r.charAt(0);) r = r.substring(1);
			if (0 === r.indexOf(t)) return r.substring(t.length, r.length);
		}
		return "";
	}, setCookie(e, t, o) {
		const n = new Date;
		n.setTime(n.getTime() + 24 * o * 60 * 60 * 1e3);
		const r = "expires=" + n.toUTCString();
		document.cookie = e + "=" + t + ";" + r + ";path=/";
	}
};
export const initAuth = async () => {
	let token = cookies.getCookie(storageIndex.cookies.Tokens);
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
	if (!cookies.getCookie(storageIndex.cookies.UserData)) return window.location.href = endPoints.authRedirect;
	if (!await get(storageIndex.userData)) {
		await set(storageIndex.cookies.UserData, JSON.parse(cookies.getCookie(storageIndex.cookies.UserData)));
		return localStorage.setItem(storageIndex.userData, btoa(cookies.getCookie(storageIndex.cookies.UserData)));
	} else await AfterAuthFunctions();
	//Every thing is fine joe
	//throw new Error(`User Data is not Defined localStorage.setItem(storageIndex.userData, btoa(JSON.stringify(userData)))`)
	//addDeviceEtag();
	//registerDeviceCast();

})();
//export async function initAuth() {
//     let a = cookies.getCookie("token");
//     return a ? ((a = JSON.parse(a)), 30 < Math.floor((Date.now() - a.exp) / 1e3 / 60) ? await fetch(endPoints.refreshToken, {}, 5e3).then((a) => (a.ok ? a.json() : null)) : a.token) : (window.location.href = endPoints.authRedirect);
// }
