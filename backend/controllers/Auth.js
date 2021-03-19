const storageIndex = require("../functions/StorageIndex");
const OAuthProvider = "https://ingress-backend-accounts.kabeersnetwork.tk/auth-server/auth/oauth/v2";
const OAuthProviderFrontend = "https://accounts.kabeersnetwork.tk/auth/oauth/v2";
// const OAuthProvider = "http://localhost:3001/auth/oauth/v2";
// const OAuthProviderFrontend = "http://localhost:3002/auth/oauth/v2";
const jwt = require("jsonwebtoken");
const axios = require("axios");
const uuid = require("uuid");
const keys = require("../keys/keys");
const {serialize} = require("../functions/misc");
// const MongoClient = require("mongodb").MongoClient.connect(keys.db.url, {
// 	useNewUrlParser: true,
// 	useUnifiedTopology: true
// }).then(db => db.db("music"));

const OAuthRedirect = async (req, res) => {
    const info = {
        clientId: "S565ds6887df646k5Y4f56IOiDWxRXS840lnnmD",
        scopes: ["openid", "s564d68a34dCn9OuUNTZRfuaCnwc6:getSong", "s564d68a34dCn9OuUNTZRfuaCnwc6:search", "s564d68a34dCn9OuUNTZRfuaCnwc6:feed", "s564d68a34dCn9OuUNTZRfuaCnwc6:history.readwrite"].join("|"),
        callback: encodeURIComponent("http://localhost:9000/auth/callback")
    };
    const state = uuid.v4();
    // req.session.state = uuid.v4();
    res.cookie(storageIndex.cookies.OAuthState, state);
    res.redirect(`${OAuthProviderFrontend}/authorize?client_id=${info.clientId}&scope=${info.scopes}&redirect_uri=${info.callback}&response_type=code&prompt=chooser&offline_access=true&nonce=${uuid.v4()}&state=${state}`);
};
const OAuthCallbackHandler = async (req, res) => {
    if (!req.query.code || !req.cookies[storageIndex.cookies.OAuthState]) return res.status(302).end();
    // req.session.b = "req.session";
    //For Some Reason state cannot be verified
    if (req.query.state !== req.cookies[storageIndex.cookies.OAuthState]) return res.status(400).json(req.session);

    try {
        const response = await axios({
            method: "post",
            url: `${OAuthProvider}/token`,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            data: serialize({
                "app_id": "S565ds6887df646k5Y4f56IOiDWxRXS840lnnmD",
                "app_secret": "pojsd682jxp31accE3mHsMtBRGVtIk0AmTV0jU3g",
                "code": req.query.code,
                "grant_type": "authorization_code"
            })
        }).then(r => r.data);
        res.cookie(storageIndex.cookies.OAuthState, null, {maxAge: 0});
        const {id_token} = response;
        const userinfo = await jwt.verify(id_token, keys.KabeerAuthPlatform_Public_RSA_Key);
        console.log(userinfo);
        res.cookie(storageIndex.cookies.UserData, JSON.stringify(userinfo));
        res.cookie(storageIndex.cookies.Tokens, JSON.stringify(response));
        //
        // res.cookie("token", JSON.stringify({
        // 	expire: "2h",
        // 	exp: Date.now(),
        // 	token: access_token
        // }), {maxAge: 7.2e+6});
        // res.cookie("oauth_refresh_token", refresh_token);
        // res.cookie("user_data_token", JSON.stringify({
        // 	expire: "2h",
        // 	exp: Date.now(),
        // 	token: access_token
        // }), {maxAge: 7.2e+6});
        // res.cookie("user_data_refresh_token", refresh_token);
        res.redirect("http://localhost:3000/" || "/");
    } catch (e) {
        return res.status(400).json(e.message);
    }
};
const RefreshToken = async (req, res) => {
    if (!req.cookies[storageIndex.cookies.Tokens]) return res.status(402).json("Refresh Token Does Not Exists");
    const refreshToken = JSON.parse(req.cookies[storageIndex.cookies.Tokens]).refresh_token;
    const tokenPayload = JSON.parse(Buffer.from(refreshToken.split(".")[1], "base64"));
    if (tokenPayload.iat > tokenPayload.exp) return res.json("Refresh Token Expired");
    try {
        const response = await axios({
            method: "post",
            url: `${OAuthProvider}/token`,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            data: serialize({
                "app_id": "S565ds6887df646k5Y4f56IOiDWxRXS840lnnmD",
                "app_secret": "pojsd682jxp31accE3mHsMtBRGVtIk0AmTV0jU3g",
                "refresh_token": refreshToken,
                "grant_type": "refresh_token"
            })
        });
        const userinfo = await jwt.verify(response.data["id_token"], keys.KabeerAuthPlatform_Public_RSA_Key);
        res.cookie(storageIndex.cookies.UserData, JSON.stringify(userinfo));
        res.cookie(storageIndex.cookies.Tokens, JSON.stringify({
            ...response.data,
            "refresh_token": refreshToken
        }));
        res.json({
            expire: "1h",
            exp: response.data["expires_in"],
            access_token: response.data,
        });
    } catch (e) {
        return res.status(400).json(e.message);
    }
};
const GetDataServerKey = async (req, res) => {
    if (!req.headers.authorization) return res.status(400).json("Bad Request");
    try {
        // TODO: add new Scopes to IDP and also require them during /redirect
        const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
            algorithms: "RS256"
        });
        if (!decoded) return res.status(400).end();
        const token = await jwt.sign({
            sub: decoded.sub,
            scope: "__kn.music.data-collection.write-watch|__kn.music.data-collection.update-rating|__kn.music.data-collection.get-song|__kn.music.data-collection.get-rating-details",
        }, process.env.DATA_SERVER_TOKEN);
        return res.json({
            sub: decoded.sub,
            scope: "__kn.music.data-collection.write-watch|__kn.music.data-collection.update-rating|__kn.music.data-collection.get-song".split("|"),
            access_token: token,
        });
    } catch (e) {
        return res.status(400).json(e.message);
    }
}
module.exports = {
    OAuthCallbackHandler,
    OAuthRedirect,
    RefreshToken,
    GetDataServerKey
};
// module.exports = router;
