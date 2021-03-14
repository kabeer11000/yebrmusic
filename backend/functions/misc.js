const makeId = (r) => {
    for (let a = "", t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", n = t.length, o = 0; o < r; o++) a += t.charAt(Math.floor(Math.random() * n));
    return a;
};
const playlistsIds = {
    LatestSongs: "PLFgquLnL59akA2PflFpeQG9L01VFg90wS",
    RomanticSongs: "PL64G6j8ePNureM8YCKy5nRFyzYf8I2noy",
    EdmSongs: "PLw-VjHDlEOgs658kAHR_LAaILBXb-s6Q5",
    TopBolloywood: "PLcRN7uK9CFpPkvCc-08tWOQo6PAg4u0lA",
    TopPop: "PLDcnymzs18LU4Kexrs91TVdfnplU3I5zs",
    Reggaeton: "PLS_oEMUyvA728OZPmF9WPKjsGtfC75LiN"
};
const YouTubeGetID = (e) => void 0 !== (e = e.replace(/(>|<)/gi, "").split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/))[2] ? e[2].split(/[^0-9a-z_\-]/i)[0] : e;
const generateRandomHeadline = (name) => {
    const templates = [`Because You Listened to ${name}`, "Based on Last Searches", `${name}`];
    return templates[Math.floor(Math.random() * (+templates.length - +0)) + +0];
};
const pickRandom = (arr, count) => {
    const _arr = [...arr];
    return [...Array(count)].map(() => _arr.splice(Math.floor(Math.random() * _arr.length), 1)[0]);
};

// Array.prototype.last = () => this[this.length - 1];

function serialize(object) {
    return Object.entries(object)
        .map(([key, value]) => `${encodeURIComponent(key)}=${encodeURIComponent(value)}`)
        .join("&");
}

//only for song_controller
const getMaximum = (e) => {
    let t, n = 1, l = 0;
    for (let m = 0; m < e.length; m++) {
        for (let r = m; r < e.length; r++) e[m] === e[r] && l++, n < l && (n = l, t = e[m]);
        l = 0;
    }
    return t && n ? {name: t, times: n} : {name: e[0], times: 1};
};

module.exports = {
    makeId,
    playlistsIds,
    YouTubeGetID,
    generateRandomHeadline,
    pickRandom,
    getMaximum,
    serialize
};
