const keys = require("./keys");
const MongoClient = require("mongodb").MongoClient.connect(keys.db.url, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(r => r.db("music"));

module.exports = MongoClient;
