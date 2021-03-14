const endPoints = require("../../../api/endpoints");
const router = require("express").Router();
const {JsonDB} = require("node-json-db");
const {Config} = require("node-json-db/dist/lib/JsonDBConfig");
const ytpl = require("ytpl");
const db = new JsonDB(new Config("myDataBase", true, true, "/"));
const axios = require("axios");

// db.push("/songs[]",{
// 	none: "adhd"
// });
const getPlaylist = ({id}) => new Promise((resolve, reject) => ytpl(id, {}, (err, list) => {
    console.log(list || err);
    if (err) return reject(err);
    resolve(list);
}).catch(reject).then(resolve));

const playlists = {
    PopularTopSongs: "PL55713C70BA91BD6E"
};

router.get("/download", async (req, res) => {
    axios.get(endPoints.getPlayListById(playlists.PopularTopSongs)).then(list => res.json(list)).catch(e => res.send(e));
});
module.exports = router;
