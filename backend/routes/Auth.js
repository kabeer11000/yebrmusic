const router = require("express").Router();
const axios = require("axios");
// const
// 	uuid = require("uuid");
// const keys = require("../keys/keys");
const {GetDataServerKey, OAuthRedirect, RefreshToken, OAuthCallbackHandler} = require("../controllers/Auth");
// const MongoClient = require("mongodb").MongoClient;
// const mongoClient = MongoClient.connect(keys.db.url, {
// 	useNewUrlParser: true,
// 	useUnifiedTopology: true
// }).then(db => db.db("music"));
//const currentURL = "http://localhost:9000/";
const currentURL = "https://kabeersmusic.herokuapp.com";
//const currentURL = "https://music.kabeersnetwork.tk/";
const endPoints = {
    callbackURL: `${process.env.HOSTNAME}auth/callback`,
    callbackURLFAKE: "http://localhost:9000/auth/callback",
    OIDCHost: `https://kabeers-auth.herokuapp.com`
    //OIDCHost: `http://localhost:3000`
};

function serialize(object) {
    return Object.entries(object)
        .map(([key, value]) => `${encodeURIComponent(key)}=${encodeURIComponent(value)}`)
        .join("&");
}

const makeid = t => {
    let o = "";
    const r = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    let a;
    for (a = 0; a < t; a++) o += r.charAt(Math.floor(Math.random() * r.length));
    return o;
};
const access_token_expired_code = 400;
/* GET Home page. */
router.get("/callback", OAuthCallbackHandler);

router.get("/redirect", OAuthRedirect);
router.post("/external/data-collection/generate", GetDataServerKey);
router.get("/user/data", (req, res) => {
    const token = req.headers["idtoken"];
    axios.post(`${endPoints.OIDCHost}/user/userinfo`, serialize({
        token: token
    }), {
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        }
    }).then(data => {
        res.status(200).json(data.data);
    }).catch(e => res.status(400).json(e.message));
});
router.get("/store/tokens/refresh", RefreshToken);
module.exports = router;
