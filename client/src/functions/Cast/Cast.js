import endPoints, {hostName} from "../../api/endpoints/endpoints";
import {storageIndex} from "../Helper/storageIndex";
import uniqid from "../Helper/randomKey";
import {createWorker} from "../Worker/createWorker";
import * as Comlink from "comlink";
import {get} from "idb-keyval";
//import Peer from "peerjs";
//import P2P from "socket.io-p2p";
//import Peer from 'peerjs';
const comlinkWorker = Comlink.wrap(new Worker("./comlink-worker.js"));

const fetchWorker = createWorker(e => {
	const s = JSON.parse(e.data);
	fetch(s.url, s).then(e => e.json()).then(e => postMessage(JSON.stringify(e)));
});

const prefix = {
	client2server: "___CLIENT---SERVER___",
	client: "___CLIENT___",
};
/*
const fetchWorker = createWorker((e) => {
	this.postMessage(async () => await fetch(e.data.url, e.data).then(value => value.json()));
});

fetchWorker.onmessage = function (e) {
	console.log(e.data); // HELLO FROM AN INLINE WORKER!
};
fetchWorker.postMessage("hello from an inline fetchWorker!");
*/
const userId = get(storageIndex.cookies.UserData).then(d => d.user_id);
const deviceId = localStorage.getItem(storageIndex.deviceEtag) ? localStorage.getItem(storageIndex.deviceEtag) : null;
//const DCS = socketIOClient(`${hostName}?userId=${userId}&deviceId=${deviceId}`, {headers: {Authorization: "Bearer authorization_token_here"}});
export const castEvent = new EventSource(endPoints.castURL(userId, deviceId));
export const castEnabled = localStorage.getItem(storageIndex.castEnabled);
castEvent.addEventListener(`pingtest-${deviceId}`, (e) => {
});
castEvent.onmessage = m => console.log(m);
castEvent.onerror = m => console.log(m);
castEvent.onopen = m => console.log(m);
/*
DCS.on(`deviceConnectionTest-5f6d20d5c41894`, e => {
	console.log('DCS');
	DCS.emit(`deviceConnectionReply-5f6d20d5c41894`, e);
});
DCS.on(`socketTest-5f6d20d5c41894`, d => {
	console.log(d);
});
DCS.on("connect", d => {
	console.log(d);
});

 */
const internal = {
	pingReturn: async () => fetch(endPoints.castPingTest, {
		method: "POST",
		headers: new Headers({
			deviceid: deviceId,
			userid: await userId
		})
	})
};
export const setCastDeviceUpdateListener = async (method, callback = () => null) => {
	method ?
		(castEvent.addEventListener(`deviceListUpdate-${await userId}`, (e) => e.origin !== hostName ? null :
			(localStorage.setItem(storageIndex.castDevices, JSON.stringify(JSON.parse(e.data).castDevices.filter(e => e !== deviceId))), console.log(e), callback(e)))) :
		(castEvent.removeEventListener(`deviceListUpdate-${await userId}`, callback));
};
export const setCastDeviceRemoveListener = async (method, callback = () => null) => {
	return method ?
		(castEvent.addEventListener(`devicePlayRemoveListener-${await userId}-${deviceId}`, (e) => e.origin !== hostName ? null : (localStorage.removeItem(storageIndex.currentlyCasting), callback(e)))) :
		(castEvent.removeEventListener(`devicePlayRemoveListener-${await userId}-${deviceId}`, callback));
};
export const setCastDevicePlayListener = async (method, callback = () => null) => {
	return method && localStorage.getItem(storageIndex.castEnabled) !== null ?
		(castEvent.addEventListener(`devicePlay-${await userId}-${deviceId}`, async (e) => e.origin !== hostName ? null : ((noRepeatFunctions.getNoRepeatId(e.timeStamp) ? callback(e) : null), noRepeatFunctions.setNoRepeatId(e.timeStamp)), localStorage.setItem(storageIndex.currentlyCasting, true))) :
		(castEvent.removeEventListener(`devicePlay-${await userId}-${deviceId}`, callback));
};
export const registerDeviceCast = async () => {
	fetchWorker.json({
		url: endPoints.updateActiveDevices,
		method: "POST",
		headers: {
			deviceid: localStorage.getItem(storageIndex.deviceEtag),
			userdata: await userId,
		},
		body: {
			deviceid: localStorage.getItem(storageIndex.deviceEtag),
			userdata: await userId,
		}
	});
	fetchWorker.onmessage = (value) => {
		console.log(value.data);
		fetchWorker.end();
	};

};
export const addDeviceEtag = async () => {
	if (!localStorage.getItem(storageIndex.deviceEtag)) localStorage.setItem(storageIndex.deviceEtag, uniqid());
};
export const unRegisterDevice = async (remoteId) => {
	localStorage.removeItem(storageIndex.castDevices);
	localStorage.removeItem(storageIndex.currentlyCasting);
	localStorage.removeItem(storageIndex.castPreventRepeat);
	await fetch(endPoints.unregisterDevice, {
		method: "POST",
		headers: new Headers({
			deviceid: remoteId ? remoteId : deviceId,
			userdata: await userId,
		})
	});
	return true;
};
export const sendCast = async (video, deviceId) => {
	fetchWorker.postMessage(JSON.stringify({
		url: endPoints.sendCastPlay,
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded",
			remotedeviceid: deviceId,
			deviceid: JSON.parse(localStorage.getItem(storageIndex.castDevices))[0],
			userdata: await get(storageIndex.cookies.UserData),
			videoelement: JSON.stringify(video)
		},
		body: {}
	}).toString());
	fetchWorker.onmessage = (value) => (localStorage.setItem(storageIndex.castingTo, deviceId), localStorage.setItem(storageIndex.currentlyCasting, true));
	return true;
};
export const sendPauseCast = async (deviceId) => {
	await fetch(endPoints.sendCastPause, {
		method: "POST",
		headers: new Headers({
			"Content-Type": "application/x-www-form-urlencoded",
			remotedeviceid: deviceId,
			deviceid: localStorage.getItem(storageIndex.deviceEtag), //JSON.parse(localStorage.getItem(storageIndex.castDevices))[0],
			userdata: await get(storageIndex.cookies.UserData),
		}),
		body: {}
	}).then(value => console.log("Cast Paused", value.json()), localStorage.removeItem(storageIndex.currentlyCasting));
	return true;
};
export const getCastDevices = () => JSON.parse(localStorage.getItem(storageIndex.castDevices)) || [];
export const currentlyCasting = localStorage.getItem(storageIndex.currentlyCasting) !== null;
export const getDeviceId = () => deviceId;
export const noRepeatFunctions = {
	setNoRepeatId: (id) => localStorage.setItem(storageIndex.castPreventRepeat, id),
	ggetNoRepeatId: e => {
		const t = localStorage.getItem(storageIndex.castPreventRepeat);
		return null === t || t !== e;
	},
	getNoRepeatId: (e) => true
};
export const castSnackbar = {
	setSnackbarKey: key => localStorage.setItem(storageIndex.castSnackbarKey, key),
	getSnackbarKey: () => localStorage.getItem(storageIndex.castSnackbarKey),
	removeSnackbarKey: () => localStorage.removeItem(storageIndex.castSnackbarKey),
};
export const CastAfterAuthFunctions = async () => {
	localStorage.removeItem(storageIndex.currentlyCasting);
	localStorage.removeItem(storageIndex.castPreventRepeat);
	addDeviceEtag()
		.then((localStorage.getItem(storageIndex.castEnabled) !== null ? registerDeviceCast().then(localStorage.setItem(storageIndex.castEnabled, true)) : null)).catch(e => console.log(e));
	if (localStorage.getItem(storageIndex.castEnabled) === null) localStorage.setItem(storageIndex.castEnabled, true);
};
