const keys = require("../keys/keys");
const scraper = require("../functions/scraper");
const MongoClient = require("mongodb").MongoClient.connect(keys.db.url, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(r => r.db("music"));
const axios = require("axios");
const misc = require("../functions/misc");

/**
 * Add To Watch History
 * @deprecated since version 2.0.0
 * @param {string} decoded_token - Access Token.
 * @param {string} id - Song Id.

 * @return {Object} - Mongodb Insert Object
 */
const listeningHistory = async (decoded_token, id) => {
    const db = await MongoClient;
    return db.collection("history").insertOne({
        type: "listeningHistory",
        time: Date.now(),
        user_id: decoded_token.sub,
        song: await scraper.getSong(id).then(song => ({
            title: song.snippet.title,
            runtime: song.snippet.duration.seconds,
            channel: song.snippet.channelTitle,
            channel_id: song.snippet.channelId,
            id: song.id
        })),
    });
};

/**
 * Save Search Query
 * @deprecated since version 2.0.0
 * @param {string} decoded_token - Access Token.
 * @param {string} query - Query.

 * @return {null} - Saves User History
 */
const searchHistory = async (decoded_token, query) => {
    const db = await MongoClient
    return await db.collection("history").insertOne({
        type: "searchHistory",
        time: Date.now(),
        user_id: decoded_token.sub,
        query: query,
    });
}

/**
 * Get User's Watch History
 * @param {object} config - Config Object.

 * @return {object} userWatchHistory - Javascript Object
 */
const getWatchHistory = async (config) => {
    return await axios.get(`http://localhost/api/history/get-history?${misc.serialize(config)}`).then(a => a.data);
}
/**
 * Get Search History
 * @param {string} user_id - Config Object.

 * @return {object} userHistory - Axios Response Object
 */
const getSearchHistory = (user_id) => {
    return axios.get(`http://localhost/api/history/get-search-history?user_id=${user_id}`).then(a => a.data);
};
/**
 * Save Search Query
 * @param {Object} config - Config Object.
 * @param {string} config.query - Query
 * @param {string} config.user_id - User's Id

 * @return {null} Nothing - Throws error when error-saving
 */
const saveSearch = async ({query, user_id}) => {
    await axios.post(`http://localhost/api/history/save-search?user_id=${user_id}`, {
        search: {
            query: query,
            timestamp: Date.now()
        },
    });
}
module.exports = {
    listeningHistory,
    searchHistory,

    getWatchHistory,


    getSearchHistory,
    saveSearch
}
