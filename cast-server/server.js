require("dotenv").config({});
const httpServer = require("http").createServer();
const {Events, RegisterDevice, DeviceDisconnectHandler, RemotePlayHandler} = require("./handlers");

const io = require("socket.io")(httpServer, {
    serveClient: true,

    cors: {
        origin: process.env.CLIENT_ORIGIN,
        methods: ["GET", "POST"],
        credentials: true
    },
    allowEIO3: true,
});

io["sockets"].on("connection", socket => {
    socket.on(Events.RegisterDevice, data => RegisterDevice(socket, data));
    socket.on(Events.DevicePlayEvent, data => RemotePlayHandler(socket, data));
    socket.on("disconnect", data => DeviceDisconnectHandler(socket, data));
});

try {
    httpServer.listen(parseInt(process.env.PORT) || 3240, () => console.log("Cast Server Started on: ", process.env.PORT || 3240));
} catch (e) {
    console.log("Error Starting the Server: ", e);
}
