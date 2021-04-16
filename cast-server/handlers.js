const jwt = require("jsonwebtoken");
const keys = require("./keys");

/**
 * TODO Add new cast-server scope to KabeerIdentityPlatform
 * @type {array}
 * @const
 */
const RequiredScopes = []; // [`${keys.auth.public}:castplay`, `${keys.auth.public}:castjoin`];
/**
 * @type {object}
 * @const
 */
const Events = {
    RegisterDevice: "RegisterDevice",
    DeviceListUpdate: "DevicesListUpdateEvent",

    DevicePeerConnectEvent: "DeviceConnectEvent",
    DeviceConnectAcceptEvent: "DeviceConnectAcceptEvent",

    DevicePlayEvent: "DevicePlayEvent",
    DevicePauseEvent: "DevicePauseEvent"
};
/**
 * @description determine if an array contains one or more items from another array.
 * @param {array} haystack - the array to search.
 * @param {array} arr - the array providing items to check for in the haystack.
 * @return {boolean} true|false if haystack contains at least one item from arr.
 */
// const CheckScopes = (haystack, arr) => arr.some(v => haystack.includes(v));
const CheckScopes = (haystack, arr) => arr.every(v => haystack.includes(v));
/**
 * @type {object}
 * @const
 */
const Rooms = {};
/**
 * @name RegisterDevice
 * @description:
 * Verifies AccessToken and IdToken
 * then assign user to an existing room or create a new room.
 * then Broadcast's Events.DeviceListUpdateEvent
 *
 * RoomId is equal to user's id ( One Room Per Account )
 * Cast between device's logged-in to one account
 *
 * @param {object} socket - Socket Object.
 * @param {object} config - Config Object.
 * @param {string} config.token - Access Token.
 * @param {string} config.id_token - ID Token Token.
 * @param {string} config.deviceId - Client Device Id.

 * @return {null}
 */
const RegisterDevice = async (socket, {token, deviceId, id_token}) => {
    if (!deviceId || !id_token || !token) return socket.disconnect(true, 'Parameter\'s Missing');
    try {
        const decoded = await jwt.verify(token, keys.KabeerAuthPlatform_Public_RSA_Key, {algorithms: "RS256"});
        if (!CheckScopes(decoded.scope.split("|"), RequiredScopes)) return socket.disconnect(true, 'Invalid ACCESS_TOKEN scope');

        const user = await jwt.verify(id_token, keys.KabeerAuthPlatform_Public_RSA_Key, {algorithms: "RS256"});
        if (decoded.type !== "access_token") return socket.disconnect(true, 'Invalid ACCESS_TOKEN');
        if (user.type !== "id_token") return socket.disconnect(true, 'Invalid ID_TOKEN');
        if (decoded.sub !== user.user_id) return socket.disconnect(true, 'Token\'s provided don\'t match');

        const roomId = decoded.sub;
        const room = Rooms[roomId];
        if (!room) {
            Rooms[roomId] = ({
                user: user,
                tokens: new Set([token]),
                devices: new Set([deviceId]),
            });
        } else Rooms[roomId] = ({
            user: user,
            tokens: new Set([...room.tokens, token]),
            devices: new Set([...room.devices, deviceId]),
        });
        await socket.join(roomId);
        socket.deviceId = deviceId;
        socket.roomId = roomId;
        // await socket.emit(Events.DeviceListUpdate, [...Rooms[roomId].devices]);
        await socket.broadcast.to(roomId).emit(Events.DeviceListUpdate, [...Rooms[roomId].devices]);
        // await socket.broadcast.to(roomId).emit(Events.DeviceListUpdate, [...new Set([...Rooms[roomId].devices, deviceId])]);
        console.log(`User Socket.id: ${socket.id} and Device.id: ${deviceId} Connected to room ${roomId}`);
    } catch (e) {
        console.log("Handled an Exception: ", e);
    }
};
/**
 * @name RemotePlayHandler

 * @description:
 * Finds if room where this device and remote device are available
 * than broadcast DevicePlayEvent if found

 * @param {object} socket - Socket Object.
 * @param {object} config - Config Object.
 * @param {string} config.playState - kn.music.schema.PlayState.
 * @param {string} config.remoteId - Remote Client Device Id.

 * @return {null}
 */
const RemotePlayHandler = async (socket, {playState, remoteId}) => {
    const room = Rooms[socket.roomId];
    if (!room) return socket.disconnect(true, 'Room not found');
    if (!room.devices.has(socket.deviceId)) return socket.disconnect(true, 'Un-Authorized');
    if (!room.devices.has(remoteId)) return socket.disconnect(true, 'Remote device not found');

    await socket.broadcast.to(socket.roomId).emit(Events.DevicePlayEvent, ({
        playState: playState,
        deviceId: socket.deviceId,
        remoteId: remoteId
    }));
    console.log(`User Socket.Id: ${socket.id} and Device.id: ${socket.deviceId} Played in room ${socket.roomId}`);
};
/**
 * @name DeviceDisconnectHandler

 * @description:
 * Handle device disconnections
 * Remove device from room or delete the room if empty

 * @param {object} socket - Socket Object.
 * @param {object|undefined} config - Config Object.

 * @return {null}
 */
const DeviceDisconnectHandler = async (socket, config) => {
    const room = Rooms[socket.roomId];
    if (!room) return socket.disconnect(true, 'Room not found');
    if (!room.devices.has(socket.deviceId)) return socket.disconnect(true, 'Un-Authorized');
    if (room.devices.size) return delete Rooms[socket.roomId]; // Empty Session
    await socket.broadcast.to(socket.roomId).emit(Events.DeviceListUpdate, [...new Set([...room.devices].filter(a => a !== socket.deviceId))]);
}

module.exports = {
    Events,
    DeviceDisconnectHandler,
    RegisterDevice,
    RemotePlayHandler,
    Rooms
}
