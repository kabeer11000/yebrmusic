importScripts("https://unpkg.com/comlink/dist/umd/comlink.js", "/socket.io/socket.io.js");

const main = {
    io: window.io,
};

Comlink.expose(main);
