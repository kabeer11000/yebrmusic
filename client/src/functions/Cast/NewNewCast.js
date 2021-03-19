import {get, set} from "idb-keyval";
import {storageIndex} from "../Helper/storageIndex";
import io from "socket.io-client";
import endPoints from "../../api/endpoints/endpoints";
// import endPoints from "../../api/endpoints/endpoints";

const user = get(storageIndex.cookies.UserData);
export const Events = {
	RegisterDevice: "RegisterDevice",
	DeviceListUpdate: "DevicesListUpdateEvent",

	DevicePeerConnectEvent: "DeviceConnectEvent",
	DeviceConnectAcceptEvent: "DeviceConnectAcceptEvent",

	DevicePlayEvent: "DevicePlayEvent",
	DevicePauseEvent: "DevicePauseEvent",
};

// const localConnection = new RTCPeerConnection();
//
// const sendChannel = localConnection.createDataChannel("sendChannel");
// sendChannel.onopen = (d) => console.log("onopen", d);
// sendChannel.onclose = (d) => console.log("onclose", d);
// sendChannel.ondatachannel = (d) => console.log("ondatachannel", d);
//


export const cookies = {
	getCookie(e) {
		for (let t = e + "=", o = decodeURIComponent(document.cookie).split(";"), n = 0; n < o.length; n++) {
			for (var r = o[n]; " " === r.charAt(0);) r = r.substring(1);
			if (0 === r.indexOf(t)) return r.substring(t.length, r.length);
		}
		return "";
	}, setCookie(e, t, o) {
		const n = new Date();
		n.setTime(n.getTime() + 24 * o * 60 * 60 * 1e3);
		const r = "expires=" + n.toUTCString();
		document.cookie = e + "=" + t + ";" + r + ";path=/";
	}, deleteCookie: (name) => document.cookie = name + "=; Max-Age=-99999999;"
};

// const accessToken = JSON.parse(cookies.getCookie(S.cookies.Tokens))["access_token"];
const accessToken = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoicmVmcmVzaF90b2tlbiIsImFwcF9uYW1lIjoiS2FiZWVycyBNdXNpYyBBcHAiLCJhcHBfaWQiOiJTNTY1ZHM2ODg3ZGY2NDZrNVk0ZjU2SU9pRFd4UlhTODQwbG5ubUQiLCJzY29wZSI6Im9wZW5pZHxzNTY0ZDY4YTM0ZENuOU91VU5UWlJmdWFDbndjNjpnZXRTb25nfHM1NjRkNjhhMzRkQ245T3VVTlRaUmZ1YUNud2M2OnNlYXJjaHxzNTY0ZDY4YTM0ZENuOU91VU5UWlJmdWFDbndjNjpmZWVkfHM1NjRkNjhhMzRkQ245T3VVTlRaUmZ1YUNud2M2Omhpc3RvcnkucmVhZHdyaXRlIiwianRpIjoiODZmOTVkMWYtMzI0OS00NDM4LWFjZDctMjM2YTBlNTQ4MWJkIiwiaWF0IjoxNjEwNjg3NjMyLCJleHAiOjE2MTE1NTE2MzJ9.pjCUryvehhrUzPeb9htAuFZEV7c85lfKXRl5CpBdiMmNfY-isqhwQq8wnqw06DuJpHIFcDlYOrkJUxQHJ-dcIhlIml0oA6d_xJ_ZrcxetRvquZJeI0wSvhFgE1s2j_cVZw40vjgMlvma9dewouVGyAPwW0cizz4mtn1aS6dO_zI";
const castEnabled = true;
const deviceId = localStorage.getItem(storageIndex.deviceEtag);

const socket = io.connect(endPoints.castServer || "localhost:9000");

const RegisterDevice = async () => socket.emit(Events.RegisterDevice, {
	token: accessToken,
	user: await user,
	deviceId: deviceId
});
const ConnectToPeer = async (id) => socket.emit(Events.DevicePeerConnectEvent, {
	token: accessToken,
	remoteId: id
});
const SendPlayCast = async (id, playState) => socket.emit(Events.DevicePlayEvent, {
	token: accessToken,
	remoteId: id,
	deviceId: deviceId,
	playState: playState
});
const SendPauseCast = async (id) => socket.emit(Events.DevicePauseEvent, {
	token: accessToken,
	remoteDeviceId: id,
});
const PeerRequestAccept = async (id) => socket.emit(Events.DeviceConnectAcceptEvent, {
	token: accessToken,
	remoteDeviceId: id
});
export const Cast = {
	onPeerRequest: () => {
		//	Call a dialog or something in player
	},
	onPeerAccept: () => {
		//	Accepted Your Cast Request
	},
	onPlayRequest: (d) => {
		console.log("AAAAAA");
	},
	onPauseRequest: () => {
	},
	controls: {
		SendPauseCast,
		SendPlayCast
	},
	socket: socket,
	peers: {
		ConnectToPeer,
		PeerRequestAccept
	},
	devices: {
		RegisterDevice,
	},
	set: {
		setPlayHandler: (f) => {
			// Someone Wants To Play
			socket.on(Events.DevicePlayEvent, async (d) => {
				return d.remoteId === deviceId ? f(d) : null;
				// const acceptedDevices = await get(S.castAcceptedDevices) || [];
				// if (acceptedDevices.includes(d.from) && d.remoteDeviceId === deviceId) f(d);
			});
		},
		setPauseHandler: (f) => {
			// Someone Wants To Pause
			socket.on(Events.DevicePlayEvent, async (d) => {
				return d.remoteDeviceId === deviceId ? f(d) : null;
				// const acceptedDevices = await get(S.castAcceptedDevices) || [];
				// if (acceptedDevices.includes(d.from) && d.remoteDeviceId === deviceId) f(d);
			});
		},
		setOnPeerRequestHandler: (f) => {
			// Someone Wants To Connect
			socket.on(Events.DevicePeerConnectEvent, async (d) => {
				console.log(d);
				return d === deviceId ? f(d) : null;
			});
		},

	},
	info: {
		getPeerDevices: async () => get(storageIndex.castDevices),
		getAcceptedPeerDevices: async () => get(storageIndex.castAcceptedDevices),
		getDeviceId: async () => deviceId
	}
};
window.onbeforeunload = () => {
	set(storageIndex.castDevices, []);
};

export const _Cast = ({onPlay}) => {
	const a = ({
		...Cast,
		onPlayRequest: onPlay
	});
	// Someone Wants To Play
	socket.on(Events.DevicePlayEvent, a.onPlayRequest);
	// Someone Wants To Pause
	socket.on(Events.DevicePlayEvent, a.onPauseRequest);
	// Someone Wants To Connect
	socket.on(Events.DevicePeerConnectEvent, a.onPeerRequest);

	return a;
};
