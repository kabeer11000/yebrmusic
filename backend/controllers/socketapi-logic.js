// import {serialize} from "../../client/src/functions/Helper/history";

const io = require("socket.io")();
const socketapi = {
    io: io
};
// const uuid = require("uuid");
// const keys = require("../keys/keys");
// const jwt = require("jsonwebtoken");
// const axios = require("axios");
// const socketSessions = require('socket.io-handshake');
// Add your socket.io logic here!
Set.prototype.find = function (cb) {
    for (const e of this) if (cb(e)) return e;
    return undefined;
};
const connectedUsers = [];
const userSchema = {
    user: {},
    token: new Set(["id"]),
    devices: new Set(["deviceId"]) // Length must only be 2
};
const Events = {
    RegisterDevice: "RegisterDevice",
    DeviceListUpdate: "DevicesListUpdateEvent",

    DevicePeerConnectEvent: "DeviceConnectEvent",
    DeviceConnectAcceptEvent: "DeviceConnectAcceptEvent",

    DevicePlayEvent: "DevicePlayEvent",
    DevicePauseEvent: "DevicePauseEvent"
};
// const OAuthProvider = "https://kabeers-auth-server.herokuapp.com/auth/oauth/v2";
// const OAuthProviderFrontend = "http://localhost:3002/auth/oauth/v2";
const state = {};

class Storage {
    // static state = {};

    insertOne(key, value) {
        state[key] = value;
        return value;
    }

    findOne(key) {
        return state[key];
    }

    deleteOne(key) {
        delete state[key];
    }

    updateOne(key, value) {
        state[key] = value;
        return value;
    }

    getStorage() {
        return state;
    }
}

/*
			const decoded = await jwt.verify(token, keys.KabeerAuthPlatform_Public_RSA_Key, {
				algorithms: "RS256"
			});

 */

const getFormData = n => {
    let e = [];
    for (let o in n) n.hasOwnProperty(o) && e.push(encodeURIComponent(o) + "=" + encodeURIComponent(n[o]));
    return e.join("&");
};
const storage = new Storage();
const AppState = [];
const RegisterDevice = async (socket, {token, user, deviceId}) => {
    /*
    Storage mai Socket id say save kar raha hu
    individual Socket kay liay data
     */
    if (!deviceId || !user || !token) return;
    const roomId = user.user_id;
    const room = AppState.find(room => room.user.user_id === roomId);
    const roomStateIndex = AppState.findIndex(room => room.user.user_id === roomId);
    // const room = storage.findOne(roomId);
    if (roomStateIndex > -1) {
        // console.log("if", room, roomStateIndex, roomId)
        AppState[roomStateIndex] = {
            user: user,
            tokens: new Set([...room.tokens, token]),
            devices: new Set([...room.devices, deviceId]),
            sockets: new Set([...room.sockets, socket.id])
        };
    } else {
        // console.log("Else", room, roomStateIndex, roomId)
        AppState.push({
            user: user,
            tokens: new Set([token]),
            devices: new Set([deviceId]),
            sockets: new Set([socket.id])
        });
    }
    await socket.join(roomId);
    socket.deviceId = deviceId;
    socket.roomId = roomId;
    await socket.broadcast.to(roomId).emit(Events.DeviceListUpdate, [...new Set([...AppState.find(room => room.user.user_id === roomId).devices, deviceId])]);

    console.log(AppState);
    console.log(`User Socket.id: ${socket.id} and Device.id: ${deviceId} Connected to room ${roomId}`);
};
const PlayOnDevice = async (socket, {playState, remoteId}) => {
    const data = AppState.find(room => room.devices.has(socket.deviceId) && room.devices.has(remoteId));
    if (!data) return;
    const roomId = data.user.user_id;
    socket.broadcast.to(roomId).emit(Events.DevicePlayEvent, ({
        playState: playState,
        deviceId: socket.deviceId,
        remoteId: remoteId
    }));
    console.log(`User Socket.Id: ${socket.id} and Device.id: ${socket.deviceId} Played in room ${roomId}`);
};
io.sockets.on("connection", socket => {
    socket.on(Events.RegisterDevice, data => RegisterDevice(socket, data));
    socket.on(Events.DevicePlayEvent, data => PlayOnDevice(socket, data));
    socket.on("disconnect", async () => {
        const room = AppState.find(room => room.devices.has(socket.deviceId));
        if (!room) return console.log("No Room");
        if (room.devices.size) {
            console.log(room);
            return AppState.filter(room => room.user.user_id !== room.user.user_id); // Empty Session
        }
        await socket.broadcast.to(room.user.user_id).emit(Events.DeviceListUpdate, [...new Set([...room.devices])]);
        console.log(AppState);
    });
});

module.exports = socketapi;
