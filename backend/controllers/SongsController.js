const jwt = require("jsonwebtoken");
const ytdl = require("ytdl-core");
const history = require("./history");
// const axios = require("axios");
// const endpoints = require("../api/endpoints");
const scraper = require("../functions/scraper");
const keys = require("../keys/keys");
const axios = require("axios");
// const ytSearch = require("yt-search");
const {getMaximum} = require("../functions/misc");
const uuid = require("uuid");
const {IndexSongOnRequest} = require("../functions/misc");
const MongoClient = require("mongodb").MongoClient.connect(keys.db.url, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(r => r.db("music"));

const ValidParams = {
    token_scope: (decoded, required_prems, d) => true
};

/*** Routes ***/
const getSong = async (req, res) => {
    if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:getSong", "s564d68a34dCn9OuUNTZRfuaCnwc6:history.readwrite"], "grant_types")) return res.status(400).end();
        const song = await ytdl.getInfo(req.query.id).then(info => ytdl.filterFormats(info.formats, "audioonly"));
        res.set("Cache-Control", "public, max-age=20000"); //6hrs approx
        res.json(song[1].url);
        IndexSongOnRequest(req.query.id);
        // console.log(await scraper.getSong(req.query.id))
        // await history.listeningHistory(decoded, req.query.id);
    } catch (e) {
        console.log(e);
        return res.status(400).json(e.message);
    }
};
const getSongDetail = async (req, res) => {
    if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:search", "s564d68a34dCn9OuUNTZRfuaCnwc6:history.readwrite"], "grant_types")) return res.status(400).end();
        res.json(await scraper.getSong(req.params.id));
    } catch (e) {
        console.log(e);
        return res.status(400).end();
    }
};
const searchSong = async (req, res) => {
    if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:search", "s564d68a34dCn9OuUNTZRfuaCnwc6:history.readwrite"], "grant_types")) return res.status(400).end();
        await history.saveSearch({
            query: req.query.q,
            user_id: decoded.sub
        });
        res.json(await scraper.searchYoutube(req.query.q));
    } catch (e) {
        console.log(e);
        return res.status(400).end();
    }
};

/*** Feed ***/
const getArtists = async (req, res) => {
    if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:feed"], "grant_types")) return res.status(400).end();
        const watches = await history.getWatchHistory({
            user_id: decoded.sub,
            limit: 5
        });
        const Artists = new Set(watches.map(a => {
            return ({
                name: a.song.snippet.channelTitle, id: a.song.snippet.channelId
            })
        }));
        if (!Artists?.size) return res.status(404).json({message: "Nothing Found"});
        res.status(200).json({
            kind: "KabeersMusic#Artists",
            items: [...Artists],
        });
    } catch (e) {
        console.log(e);
        return res.status(400).end();
    }
};
const searchFeed = async (req, res) => {
    if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        // const db = await MongoClient;
        if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:feed"], "grant_types")) return res.status(400).end();
        const queries = await history.getSearchHistory(decoded.sub).then(a => a.map(b => b.query + " "))
        // const queries = await db.collection("history")
        //     .find({user_id: decoded.sub, type: "searchHistory"}).limit(3).toArray()
        //     .then(value => value.map(v => v.query + " "));
        const response = await scraper.searchYoutube(queries);
        return res.status(200).json({...response, title: `Based on Your Last Search`});
    } catch (e) {
        return res.status(400).end();
    }
};
const topArtist = async (req, res) => {
    if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        // const db = await MongoClient;
        if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:feed"], "grant_types")) return res.status(400).end();

        const watches = await history.getWatchHistory({
            user_id: decoded.sub,
            limit: 5
        });
        // const watches = await db.collection("history").find({
        //     user_id: "SD6YoQaxbvSMrXkHuXWQM9kjgcJuYN4aCQNbc8jA" || decoded.sub,
        //     type: "listeningHistory",
        // }).limit(5).toArray();

        const artist = getMaximum(watches.map(v => v.song.snippet.channelTitle));
        if (artist.name) {
            const response = await scraper.searchYoutube(`${artist.name} official music`);
            return res.json({
                ...response,
                title: `Because You Listened to ${artist.name}`
            });
        } else res.end();
    } catch (e) {
        return res.status(400).end();
    }
};
//"http://localhost:9000/top-artist.json"
const topArtistsRanked = async (req, res) => {
    if (!req.headers.authorization) return res.status(400).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        // const db = await MongoClient;
        if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:feed"], "grant_types")) return res.status(400).end();
        const watches = await history.getWatchHistory({
            user_id: decoded.sub,
        });
        // const watches = await db.collection("history").find({
        //     user_id: "SD6YoQaxbvSMrXkHuXWQM9kjgcJuYN4aCQNbc8jA" || decoded.sub,
        //     type: "listeningHistory",
        // }).limit(5).toArray();

        const artists = new Set(watches.map(v => v.song.snippet.channelTitle));
        const response = [];
        for (const artist of artists) response.push({
            ...await scraper.searchYoutube(`${artist} official music`),
            title: artist
        });
        return res.json({
            kind: "KabeersMusic#cumilativeArtistsList",
            etag: uuid.v4(),
            regionCode: "PK",
            pageInfo: {
                totalResults: response.length,
            },
            artists: response
        });
    } catch (e) {
        console.log(e);
        return res.status(400).end();
    }
};
const Discover = async (req, res) => {
    const db = await MongoClient;
    if (!req.headers.authorization) return res.status(400).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        const candidates = await db.collection("watch-candidates").findOne({
            user_id: decoded.sub
        });
        res.json({
            "kind": "KabeersMusic#discoverListResponse",
            "etag": Math.random(),
            "regionCode": "PK",
            "pageInfo": {
                "totalResults": candidates['candidates'].length
            },
            "items": candidates['candidates']
        });
    } catch (e) {
        console.log(e);
        return res.status(400).end();
    }
}
module.exports = {
    getSong,
    searchSong,
    getArtists,
    searchFeed,
    topArtist,
    topArtistsRanked,
    getSongDetail,
    Discover
};
