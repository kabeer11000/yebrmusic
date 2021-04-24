const endpoints = require("../api/endpoints");
const keys = require("../keys");
const MongoClient = require("mongodb").connect(keys.db.url, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(db => db.db("music"));
const axios = require("axios").default;
const jwt = require("jsonwebtoken");
const history = require("../functions/history");
const scraper = require("../functions/scraper");
const {ValidParams} = require("../functions/misc");
const {getMaximum} = require("../functions/misc");
const nodeIPLocate = require("node-iplocate");
/**
 * But Working For Now
 * @deprecated
 * @param req
 * @param res
 * @returns {Promise<*>}
 * @constructor
 */
const KnnRankedCandidates = async (req, res) => {
    if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        const db = await MongoClient;
        let candidates = await db.collection("watch-candidates").findOne({
            user_id: decoded.sub
        });
        if (!candidates) return res.status(400).json("Cannot Find Candidates");
        // await axios.get("http://localhost:9000/recommendation/generate-candidates");
        // candidates = await db.collection("watch-candidates").findOne({
        //     user_id: decoded.sub
        // });

        const watches = req.body.watches || [];
        const watch_history = (await history.getWatchHistory({
            limit: 4,
            user_id: decoded.sub
        })).map(a => a.song);
        const recommendations = await axios.post(endpoints.RecommendationServer.KnnRankedCandidates, {
            candidates: candidates['candidates'],
            watches: [...watches, ...watch_history],
            user_id: decoded.sub,
            total_items: 20
        }).then(a => a.data);
        res.json({
            "kind": "KabeersMusic#discoverListResponse",
            "etag": Math.random(),
            "regionCode": "PK",
            "pageInfo": {
                "totalResults": recommendations.length
            },
            "items": recommendations
        });
    } catch (e) {
        console.log(e);
        res.status(400).end();
    }
}
/**
 * GenerateCandidates
 * @param req
 * @param res
 * @returns {Promise<*>}
 * @constructor
 */
const GenerateCandidates = async (req, res) => {
    if (req.query.retrain) await axios.get(endpoints.RecommendationServer.RetrainModel);
    const predictions = await axios.get(endpoints.RecommendationServer.GetAllCandidates).then(a => a.data);
    if (!predictions) return res.json(predictions);
    const db = await MongoClient;
    const user_ids = predictions.map(a => a.user_id);
    await db.collection("watch-candidates").deleteMany({
        id: {
            $in: user_ids
        }
    });
    await db.collection("watch-candidates").insertMany(predictions);
    return res.json("Saved Candidates");
}
/**
 * Development Only
 * @deprecated
 * @param req
 * @param res
 * @returns {Promise<*>}
 * @private
 */
const _GetCandidatesByUser = async (req, res) => {
    if (!process.env.NODE_ENV) return res.status(400).end();
    const db = await MongoClient;
    const response = await db.collection("watch-candidates").findOne({
        user_id: req.params.user_id
    });
    return res.json(response);
};
/**
 * Based On Last Search Home feed
 * @param req
 * @param res
 * @returns {Promise<*>}
 * @constructor
 */
const BasedOnLastSearches = async (req, res) => {
    if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        if (!decoded.scope.split("|").includes("s564d68a34dCn9OuUNTZRfuaCnwc6:feed")) return res.status(400).end();
        const searchHistory = await history.getSearchHistory(decoded.sub).then(a => a && a.length ? [...new Set(a.map(b => b.query))].slice((a.length - 2), a.length).reverse() : []);
        let queries = []
        /** @attention
         * @deprecated
         * This will return null country in development **/
        if (!searchHistory.length) queries = ['vevo music', 'top music'];
        const country = (await nodeIPLocate(req.headers['x-forwarded-for'] || req.connection.remoteAddress)).country
        if (country) queries.push(`top music in ${country}`);
        const r = new Set();
        for (const query of queries) {
            /**
             * Call SearchYoutube with return value from query expression
             */
            // r.add((await (query |> scraper.searchYoutube)).items);
            console.log(query)
            const results = (await scraper.searchYoutube(query)).items.slice(0, searchHistory.length ? 3 : 5);
            for (const song of results) {
                r.add(song);
            }
        }
        // const response = await scraper.searchYoutube(queries.join(" "));
        // console.log([...r][0])
        const response = ({
            kind: "KabeersMusic#searchListResponse",
            etag: Math.random(),
            regionCode: "PK",
            title: history.length ? `Based on Your Last Searches` : `Music You might like`,
            pageInfo: {
                totalResults: r.size,
            },
            items: [...r]
        })
        return res.status(200).json(response);
    } catch (e) {
        return res.status(400).end();
    }
};
/**
 * Because You Listened To
 * @param req
 * @param res
 * @returns {Promise<*>}
 * @constructor
 */
const BecauseYouListenedTo = async (req, res) => {
    if (!req.headers.authorization) return res.status(402).json("Bad Request");
    try {
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        if (!decoded.scope.split("|").includes("s564d68a34dCn9OuUNTZRfuaCnwc6:feed")) return res.status(400).end();
        const watches = await history.getWatchHistory({
            user_id: decoded.sub,
            limit: 5
        });
        if (watches.length) {
            const artist = getMaximum(watches.map(v => v.song.snippet.channelTitle));
            if (artist.name) {
                const response = await scraper.searchYoutube(`${artist.name} official music`);
                return res.json({
                    ...response,
                    title: `Because You Listened to ${artist.name}`
                });
            } else res.end();
        } else {
            const watches = await history.getWatchHistory({
                limit: 5
            });
            const artist = getMaximum(watches.map(v => v.song.snippet.channelTitle));
            const response = await scraper.searchYoutube(`${artist.name} official music`);
            return res.json({
                ...response,
                title: `Top artist right now`
            });
        }
    } catch (e) {
        return res.status(400).end();
    }
}
module.exports = {
    KnnRankedCandidates,
    GenerateCandidates,
    _GetCandidatesByUser,

    BecauseYouListenedTo,
    BasedOnLastSearches
}
