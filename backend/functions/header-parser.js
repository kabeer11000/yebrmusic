const MongoClient = require("../MongoClient");

const RequestParser = {
    Strict: async (req, res, next) => {
        if (!req.headers.authorization) return res.status(400).json("No Access Token Attached");
        const db = await MongoClient;
        const user = await db.collection("auth-api-sessions").findOne({
            token: req.headers.authorization.split(" ")[1]
        });
        if (!user) return res.status(400).json("Invalid API Session");
        req.__kn = {session: {user}}
        next();
    },
    Optional: async (req, res, next) => {
        if (!req.headers.authorization) {
            req.__kn = {session: {}};
            return next();
        }
        const db = await MongoClient;
        const user = await db.collection("auth-api-sessions").findOne({
            token: req.headers.authorization.split(" ")[1]
        });
        if (!user) {
            req.__kn = {session: {}};
            return next();
        }
        req.__kn = {session: {user}}
        next();
    }
}
module.exports = {
    RequestParser
};
