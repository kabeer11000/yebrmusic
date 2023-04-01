export const Events = {
    RegisterDevice: "RegisterDevice",
    DeviceListUpdate: "DevicesListUpdateEvent",

    DevicePeerConnectEvent: "DeviceConnectEvent",
    DeviceConnectAcceptEvent: "DeviceConnectAcceptEvent",

    DevicePlayEvent: "DevicePlayEvent",
    DevicePauseEvent: "DevicePauseEvent",
};

export const RegisterDevice = async ({accessToken, user, deviceId, socket}) => socket.emit(Events.RegisterDevice, {
    token: accessToken,
    user: await user,
    deviceId: deviceId
});

export const HandlePlayEvent = async (d) => {
    console.log(d);
};
