/**
 * @deprecated
 * @param r
 * @returns {*}
 */
const makeId = (r) => {
    for (let a = "", t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", n = t.length, o = 0; o < r; o++) a += t.charAt(Math.floor(Math.random() * n));
    return a;
};
/**
 * @type {{TopBolloywood: string, LatestSongs: string, Reggaeton: string, EdmSongs: string, RomanticSongs: string, TopPop: string}}
 */
const playlistsIds = {
    LatestSongs: "PLFgquLnL59akA2PflFpeQG9L01VFg90wS",
    RomanticSongs: "PL64G6j8ePNureM8YCKy5nRFyzYf8I2noy",
    EdmSongs: "PLw-VjHDlEOgs658kAHR_LAaILBXb-s6Q5",
    TopBolloywood: "PLcRN7uK9CFpPkvCc-08tWOQo6PAg4u0lA",
    TopPop: "PLDcnymzs18LU4Kexrs91TVdfnplU3I5zs",
    Reggaeton: "PLS_oEMUyvA728OZPmF9WPKjsGtfC75LiN"
};
/**
 *
 * @param e
 * @returns {string|string[]}
 * @constructor
 * @deprecated
 */
const YouTubeGetID = (e) => void 0 !== (e = e.replace(/(>|<)/gi, "").split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/))[2] ? e[2].split(/[^0-9a-z_\-]/i)[0] : e;
/**
 *
 * @param name
 * @deprecated
 * @returns {string}
 */
const generateRandomHeadline = (name) => {
    const templates = [`Because You Listened to ${name}`, "Based on Last Searches", `${name}`];
    return templates[Math.floor(Math.random() * (+templates.length - +0)) + +0];
};

/**
 *
 * @param arr
 * @deprecated
 * @param count
 * @returns {*[]}
 */
const pickRandom = (arr, count) => {
    const _arr = [...arr];
    return [...Array(count)].map(() => _arr.splice(Math.floor(Math.random() * _arr.length), 1)[0]);
};

// Array.prototype.last = () => this[this.length - 1];
/**
 *
 * @param object
 * @returns {string}
 */
function serialize(object) {
    return Object.entries(object)
        .map(([key, value]) => `${encodeURIComponent(key)}=${encodeURIComponent(value)}`)
        .join("&");
}

/**
 *
 * @param e
 * @returns {{times: number, name: *}}
 */
const getMaximum = (e) => {
    let t, n = 1, l = 0;
    for (let m = 0; m < e.length; m++) {
        for (let r = m; r < e.length; r++) e[m] === e[r] && l++, n < l && (n = l, t = e[m]);
        l = 0;
    }
    return t && n ? {name: t, times: n} : {name: e[0], times: 1};
};
/**
 *
 * @param id
 * @returns {Promise<void>}
 * @constructor
 */
const IndexSongOnRequest = async (id) => {
    const scraper = require("./scraper");
    const axios = require("axios");
    const endpoints = require("../api/endpoints");
    try {
        const songDetails = await scraper.getSong(id);
        await axios.post(endpoints.DataCollectionServer.IndexSong, JSON.stringify({
            song: songDetails, token: process.env.DATA_SERVER_TOKEN
        }));
    } catch (e) {
        console.re.log(e);
        console.log("An error occurred while indexing song")
    }
}
/**
 *
 * @type {{check: (function(*, *, *): *), respond: (function(*): *)}}
 */
const ValidParams = {
    /**
     *
     * @param req
     * @param knownParams
     * @param m
     * @returns {boolean}
     */
    check: (req, knownParams, m) => {
        const params = Object.keys(req[m]);
        return knownParams.every(i => params.includes(i));
    },
    /**
     *
     * @param res
     * @returns {*}
     */
    respond: (res) => res.status(400).json(`Check Your Params Some Were Missing.`)
};
/**
 *
 * @type {{makeId: (function(*): *), YouTubeGetID: (function(*): (string|string[])), serialize: (function(*=): string), ValidParams: {check: (function(*, *, *): *), respond: (function(*): *)}, playlistsIds: {TopBolloywood: string, LatestSongs: string, Reggaeton: string, EdmSongs: string, RomanticSongs: string, TopPop: string}, IndexSongOnRequest: (function(*=): Promise<void>), getMaximum: (function(*): {times: number, name: *}), generateRandomHeadline: (function(*): string), pickRandom: (function(*, *=): *[])}}
 */
module.exports = {
    IndexSongOnRequest,
    makeId,
    playlistsIds,
    YouTubeGetID,
    generateRandomHeadline,
    pickRandom,
    getMaximum,
    serialize,
    ValidParams
};
