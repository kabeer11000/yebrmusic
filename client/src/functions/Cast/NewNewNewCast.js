import endPoints from "../../api/endpoints/endpoints";
import {get, set} from "idb-keyval";
import {storageIndex as StorageIndex} from "../Helper/storageIndex";
import io from "socket.io-client";
import Peer from "peerjs";
import {Events, HandlePlayEvent, RegisterDevice} from "./Cast-functions";

// const user = get(StorageIndex.cookies.UserData);

const accessToken = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoicmVmcmVzaF90b2tlbiIsImFwcF9uYW1lIjoiS2FiZWVycyBNdXNpYyBBcHAiLCJhcHBfaWQiOiJTNTY1ZHM2ODg3ZGY2NDZrNVk0ZjU2SU9pRFd4UlhTODQwbG5ubUQiLCJzY29wZSI6Im9wZW5pZHxzNTY0ZDY4YTM0ZENuOU91VU5UWlJmdWFDbndjNjpnZXRTb25nfHM1NjRkNjhhMzRkQ245T3VVTlRaUmZ1YUNud2M2OnNlYXJjaHxzNTY0ZDY4YTM0ZENuOU91VU5UWlJmdWFDbndjNjpmZWVkfHM1NjRkNjhhMzRkQ245T3VVTlRaUmZ1YUNud2M2Omhpc3RvcnkucmVhZHdyaXRlIiwianRpIjoiODZmOTVkMWYtMzI0OS00NDM4LWFjZDctMjM2YTBlNTQ4MWJkIiwiaWF0IjoxNjEwNjg3NjMyLCJleHAiOjE2MTE1NTE2MzJ9.pjCUryvehhrUzPeb9htAuFZEV7c85lfKXRl5CpBdiMmNfY-isqhwQq8wnqw06DuJpHIFcDlYOrkJUxQHJ-dcIhlIml0oA6d_xJ_ZrcxetRvquZJeI0wSvhFgE1s2j_cVZw40vjgMlvma9dewouVGyAPwW0cizz4mtn1aS6dO_zI";
// const castEnabled = true;
const deviceId = localStorage.getItem(StorageIndex.deviceEtag);

export class Cast {
    _onPlayEvent = null;
    _socket = null;
    _peerConnection = null;
    _peerJS_peers = [];
    _device = {
        id: deviceId
    }
    layers = {
        devices: {
            RegisterDevice,
        },
        info: {
            getPeerDevices: () => get(StorageIndex.castDevices),
            getAcceptedPeerDevices: () => get(StorageIndex.castAcceptedDevices),
            getDeviceId: async () => this._device.id
        },
    };
    core = {
        PeerJS: {
            async getPeerDevices() {
                return this._peerJS_peers;
            },
            connect: this._connect_to_peer
        }
    };

    constructor({onPlayEvent, onPauseEvent}) {
        this._onPlayEvent = onPlayEvent;
        this._peerConnection = new Peer(deviceId);
        const socket = io.connect(endPoints.castServer);
        // this._peerConnection.on(Events.DevicePlayEvent, HandlePlayEvent);

        console.log("CastJS: New Cast Session Created", `SocketID: ${socket.id}`, `DeviceId: ${deviceId}`);
        RegisterDevice({
            accessToken,
            deviceId: this._device.id,
            user: get(StorageIndex.cookies.UserData),
            socket
        }).then(() => console.log("CastJS: ", "Device Registered"));
        this._peerConnection.on('connection', (connection) => {
            connection.on("data", HandlePlayEvent);
            connection.send({porn: "data"});
        })
        socket.on(Events.DeviceListUpdate, async devices => {
            try {
                const deviceId = this._device.id;
                const newDevices = devices.filter(d => d !== deviceId);
                // const oldDevices = await get(StorageIndex.castDevices);
                // const ids = oldDevices.filter(i => newDevices.findIndex(f => f === i)) // Third Way
                // console.log(ids);
                // ids.map(id => this._connect_to_peer("EDGE"));
                await this._connect_to_peer("EDGE");
                await set(StorageIndex.castDevices, newDevices);
                console.log("CastJS: Cast Devices Updated", devices);
            } catch (e) {
                console.error("CastJS", e)
            }
        });

        socket.on("connection", () => console.log("CastJS: Connected To A Cast Server"))
        // Devices Update Event
    }

    async _connect_to_peer(id) {
        const connection = this._peerConnection.connect(id);
        connection.on('open', () => {
            connection.on(Events.DevicePlayEvent, this._onPlayEvent);
            this._peerJS_peers.push(id);
            console.log("CastJS: Connected To Peer", id);
        });
        connection.on('disconnect', () => this._peerJS_peers.splice(this._peerJS_peers.indexOf(id), 1));
    }
}
