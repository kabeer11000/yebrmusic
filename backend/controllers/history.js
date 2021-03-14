const keys = require("../keys/keys");
const scraper = require("../functions/scraper");
const MongoClient = require("mongodb").MongoClient.connect(keys.db.url, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(r => r.db("music"));

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
const searchHistory = async (decoded_token, query) => {
    const db = await MongoClient
    return await db.collection("history").insertOne({
        type: "searchHistory",
        time: Date.now(),
        user_id: decoded_token.sub,
        query: query,
    });
}
module.exports = {
    listeningHistory,
    searchHistory
}
