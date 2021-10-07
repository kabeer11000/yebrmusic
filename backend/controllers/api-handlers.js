const ytdl = require("ytdl-core");
const history = require("../functions/history");
const scraper = require("../functions/scraper");
const uuid = require("uuid");
const {IndexSongOnRequest} = require("../functions/misc");
const MongoClient = require("../MongoClient");

/**
 * Currently Not Working
 * @deprecated
 * @type {{token_scope: (function(*, *, *): boolean)}}
 */
const ValidParams = {
    token_scope: (decoded, required_prems, d) => true
};

/*** Routes ***/
/**
 * Get Song Playable URI Route Handler
 * @param req
 * @param res
 * @returns {Promise<*>}
 */
const resolveAudioURI = async (req, res) => {
    // if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        // const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
        //     algorithms: "RS256"
        // });
        // if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:getSong", "s564d68a34dCn9OuUNTZRfuaCnwc6:history.readwrite"], "grant_types")) return res.status(400).end();
        const audio = await ytdl.getInfo(req.params.id).then(info => ytdl.filterFormats(info.formats, "audioonly"));
        res.set("Cache-Control", "public, max-age=20000"); //6hrs approx
        console.log(audio)
        res.json(audio[1].url);
        await IndexSongOnRequest(req.params.id);
        // console.log(await scraper.getSong(req.query.id))
        // if (req.__kn.session.user) await history.listeningHistory(decoded, req.query.id);
    } catch (e) {
        console.log(e);
        return res.status(400).json(e.message);
    }
};
/**
 * Get Song Detail Route Handler
 * @param req
 * @param res
 * @returns {Promise<*>}
 */
const getAudioMetaData = async (req, res) => {
    // if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        // const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
        //     algorithms: "RS256"
        // });
        // if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:search", "s564d68a34dCn9OuUNTZRfuaCnwc6:history.readwrite"], "grant_types")) return res.status(400).end();
        res.json(await scraper.getSong(req.params.id));
    } catch (e) {
        console.log(e);
        return res.status(400).end();
    }
};
/**
 * Search handler
 * @param req
 * @param res
 * @returns {Promise<*>}
 */
const searchSong = async (req, res) => {
    // if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        // const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
        //     algorithms: "RS256"
        // });
        // if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:search", "s564d68a34dCn9OuUNTZRfuaCnwc6:history.readwrite"], "grant_types")) return res.status(400).end();
        if (req.__kn.session.user) await history.saveSearch({
            query: req.query.q,
            user_id: req.__kn.session.user.user_id
        });
        res.json(await scraper.searchYoutube(req.query.q));
    } catch (e) {
        console.log(e);
        return res.status(400).end();
    }
};
const GetHistory = async (req, res) => {
    res.json(await history.getWatchHistory({
        // user_id: req.__kn.session.user.user_id,
        // limit: 5
    }))
}
/**
 * Home Page Get Top Artists Slider
 * @param req
 * @param res
 * @returns {Promise<*>}
 */
const AllArtistsChips = async (req, res) => {
    // if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        // const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
        //     algorithms: "RS256"
        // });
        // if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:feed"], "grant_types")) return res.status(400).end();
        const watches = (req.__kn.session.user) ? await history.getWatchHistory({
            user_id: req.__kn.session.user.user_id,
            limit: 5
        }) : await history.getWatchHistory({}) || [];
        const Artists = new Set(watches.map(a => ({
            name: a.song.snippet.channelTitle, id: a.song.snippet.channelId
        })));
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

const GetRecentlyAdded = async (req, res) => {
    // if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        // const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
        //     algorithms: "RS256"
        // });
        // if (!decoded.scope.split("|").includes("s564d68a34dCn9OuUNTZRfuaCnwc6:feed")) return res.status(400).json("Invalid Token Scope")
        const response = await scraper.getPlayList("PLkqz3S84Tw-TGS_ltn3Yu_4JQAulJqXrL");
        return res.json({
            ...response,
            title: "Recently Added"
        });
    } catch (e) {
        (e.name !== ("JsonWebTokenError" || "TokenExpiredError")) && console.log(e);
        return res.status(400).end();
    }
};
const topArtistsRanked = async (req, res) => {
    // if (!req.headers.authorization) return res.status(400).json("Bad Request");
    try {
        // const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
        //     algorithms: "RS256"
        // });
        // const db = await MongoClient;
        // if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:feed"], "grant_types")) return res.status(400).end();
        // const watches = await history.getWatchHistory({
        //     user_id: req.__kn.session.user.user_id,
        // });
        // const watches = await db.collection("history").find({
        //     user_id: "SD6YoQaxbvSMrXkHuXWQM9kjgcJuYN4aCQNbc8jA" || decoded.sub,
        //     type: "listeningHistory",
        // }).limit(5).toArray();

        // const artists = new Set(watches.map(v => v.song.snippet.channelTitle));
        // const response = [];
        res.write(`{"kind": "KabeersMusic#cumilativeArtistsList", "etag": "${uuid.v4()}", "regionCode": "PK", "artists": [`);
        const artists = ["travis scott", "justin bieber"];
        for (const [index, artist] of artists.entries()) res.write(`${JSON.stringify({
            ...await scraper.searchYoutube(`${artist} official music`),
            title: artist
        })} ${index === artists.length - 1 ? "" : ","}`);
        res.write(`], "pageInfo": {"totalResults": ${artists.length}}}`);
        res.end();
        // return res.json({
        //     kind: "KabeersMusic#cumilativeArtistsList",
        //     etag: uuid.v4(),
        //     regionCode: "PK",
        //     pageInfo: {
        //         totalResults: response.length,
        //     },
        //     artists: response
        // });
    } catch (e) {
        console.log(e);
        return res.status(400).end();
    }
};

const _topArtistsRanked = async (req, res) => {
    // if (!req.headers.authorization) return res.status(400).json("Bad Request");
    try {
        // const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
        //     algorithms: "RS256"
        // });
        // const db = await MongoClient;
        // if (!ValidParams.token_scope(decoded, ["s564d68a34dCn9OuUNTZRfuaCnwc6:feed"], "grant_types")) return res.status(400).end();
        const watches = await history.getWatchHistory({
            user_id: req.__kn.session.user.user_id,
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
    // if (!req.headers.authorization) return res.status(400).json("Bad Request");
    try {
        // const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
        //     algorithms: "RS256"
        // });
        const candidates = await db.collection("watch-candidates").findOne({
            user_id: req.__kn.session.user.user_id
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
    resolveAudioURI,
    searchSong,
    AllArtistsChips,
    topArtistsRanked,
    getAudioMetaData,
    Discover,
    GetRecentlyAdded,
    GetHistory
};
