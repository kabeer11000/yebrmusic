const storageIndex = require("../functions/storage-index");
const jwt = require("jsonwebtoken");
const axios = require("axios");
const uuid = require("uuid");
const keys = require("../keys");
const config = require("../config");
const {serialize} = require("../functions/misc");
const MongoClient = require("../MongoClient");

const getSavedAccounts = async (req) => {
    if (req.cookies[storageIndex.cookies.AccountsCookie]) {
        const decoded = await jwt.verify(req.cookies[storageIndex.cookies.AccountsCookie], keys.KabeerAuthPlatform_Public_RSA_Key);
        return decoded.accounts;
    }
    return [];
};
const GetAPIKeyWithoutAccount = async (req, res) => {
    const token = await require("crypto").randomBytes(15).toString('hex');
    res.cookie(storageIndex.cookies.SignedOutId, token, {
        secure: true,
        expiresIn: 2147483647,
    });
    res.cookie(storageIndex.cookies.SignedOutId, token, {
        secure: true,
        expiresIn: 2147483647,
    });
};
const FU = "23c21d659cbb22ee0fcd7c3c1820dd"
const GetAPIKey = async (req, res) => {
    // return res.status(200).json({
    //     public_grant: true,
    //     response_type: "KN.MUSIC.PUBLIC.ACCESS",
    //     serviceLoginToken: null,
    //     ["serviceLoginToken.context"]: {
    //         secure: true,
    //         key: storageIndex.cookies.APIToken,
    //     }
    // })
    const deviceId = req.cookies[storageIndex.cookies.KabeersAuthDeviceId];
    if (!deviceId) return res.status(400).end();
    return res.cookie(storageIndex.cookies.APIToken, FU, {
        secure: true,
        // sameSite: "none",
    }) && res.status(200).json({
        serviceLoginToken: FU,
        ["serviceLoginToken.context"]: {
            secure: true,
            key: storageIndex.cookies.APIToken,
        }
    });
}
const _GetAPIKey = async (req, res) => {
    const accounts = await getSavedAccounts(req);
    const account = accounts ? accounts[parseInt(req.headers.authuser)] : null;
    if (!account || !account.session_token || !account.user_id) return res.status(400).json("Accounts Not Found");
    const deviceId = req.cookies[storageIndex.cookies.KabeersAuthDeviceId];
    if (!deviceId) return res.status(400).end();
    const sessionResponse = ({
        status: "SESSION_VERIFIED"
    })
    /*
    const sessionResponse = (await axios({
        method: "post",
        url: `http://localhost:3001/internals/service-login/user/sessions/verify`,
        headers: {"Content-Type": "application/json"},
        data: JSON.stringify({
            app_id: keys.app.app_public,
            app_secret: keys.app.app_secret,
            device_id: deviceId,
            session_token: account.session_token,
            user_id: account.user_id
        })
    })).data;
    */
    if (sessionResponse.status !== "SESSION_VERIFIED") return res.status(400).json({
        status: "INVALID_SESSION",
        proxy_status: sessionResponse.status,
    });
    const db = await MongoClient;
    const apiSession = await db.collection("auth-api-sessions").findOne({
        user_id: account.user_id,
    });
    if (apiSession) return res.cookie(storageIndex.cookies.APIToken, apiSession.token, {
        secure: true,
    }) && res.status(200).json({
        serviceLoginToken: apiSession.token,
        ["serviceLoginToken.context"]: {
            secure: true,
            key: storageIndex.cookies.APIToken,
            // d: deviceId,
        }
    });
    const token = await require("crypto").randomBytes(15).toString('hex');
    await db.collection("auth-api-sessions").insertOne({
        user_id: account.user_id,
        token,
    });
    return res.cookie(storageIndex.cookies.APIToken, token, {
        secure: true,
    }) && res.status(200).json({
        serviceLoginToken: token,
        ["serviceLoginToken.context"]: {
            secure: true,
            key: storageIndex.cookies.APIToken,
            // d: deviceId,
        }
    });
}
/*
const ServiceLogin = async (req, res) => {
    try {
        const accounts = await getSavedAccounts(req);
        const account = accounts ? accounts[parseInt(req.headers.authuser)] : null;
        if (!account || !account.session_token || !account.user_id) return res.status(400).json("Accounts Not Found");
        const deviceId = req.cookies[storageIndex.cookies.KabeersAuthDeviceId];
        if (!deviceId) return res.status(400).end();
        const {access_token} = (await axios({
            method: "post",
            url: `${config.K_AUTH_URL}/internals/service-login/token`,
            headers: {"Content-Type": "application/json"},
            data: JSON.stringify({
                app_id: keys.app.app_public,
                app_secret: keys.app.app_secret,
                device_id: deviceId,
                session_token: account.session_token,
                user_id: account.user_id
            })
        })).data;
        res.cookie(storageIndex.cookies.AccessToken, access_token, {
            // maxAge: 5.4e+6,
            // secure: config.SECURE_COOKIES,
            domain: config.FRONTEND_COOKIE_DOMAIN
        });
        return res.json({
            access_token: access_token
        });
    } catch (e) {
        res.status(400).json(e.message)
    }
};
*/
/**
 * Kabeer's IDP ServiceLogin
 * @param req
 * @param res
 * @returns {Promise<void>}
 * @constructor
 */
const _ServiceLogin = async (req, res) => {
    await axios({
        method: "post",
        url: `${config.K_AUTH_URL}/internals/service-login/token`,
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        data: serialize({
            "app_id": keys.app.app_public,
            "app_secret": keys.app.app_secret,
            // ""
        })
    })
}
/**
 * Kabeer's IDP OAuth Redirect
 * @param req
 * @param res
 * @returns {Promise<void>}
 * @constructor
 */
const OAuthRedirect = async (req, res) => {
    const info = {
        clientId: keys.app.app_public,
        scopes: config.K_AUTH_SCOPE,
        callback: encodeURIComponent(`${config.SELF_URL}/auth/callback`)
    };
    const state = uuid.v4();
    res.cookie(storageIndex.cookies.OAuthState, state, {
        domain: config.FRONTEND_COOKIE_DOMAIN
    });
    res.redirect(`${config.K_AUTH_FRONTEND}/auth/oauth/v2/authorize?client_id=${info.clientId}&service_login=true&scope=&redirect_uri=${info.callback}&response_type=code&prompt=chooser&offline_access=true&nonce=${uuid.v4()}&state=${state}`);
};
/**
 * Kabeer's IDP OAuth Handler
 * @param req
 * @param res
 * @deprecated
 * @returns {Promise<*>}
 * @constructor
 */
const OAuthCallbackHandler = async (req, res) => {
    if (!req.query.code || !req.cookies[storageIndex.cookies.OAuthState]) return res.status(302).end();
    if (req.query.state !== req.cookies[storageIndex.cookies.OAuthState]) return res.redirect(`${config.FRONTEND_URL}/internal/error/INVALID_STATE/view?redirect_to=${encodeURIComponent(`${config.SELF_URL}/auth/redirect`)}`);

    try {
        const response = await axios({
            method: "post",
            url: `${config.K_AUTH_URL}/auth/oauth/v2/token`,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            data: serialize({
                "app_id": keys.app.app_public,
                "app_secret": keys.app.app_secret,
                "code": req.query.code,
                "grant_type": "authorization_code"
            })
        }).then(r => r.data);
        res.clearCookie(storageIndex.cookies.OAuthState);
        const {id_token, refresh_token} = response;
        const userinfo = await jwt.verify(id_token, keys.KabeerAuthPlatform_Public_RSA_Key);
        const tokenPayload = await jwt.verify(refresh_token, keys.KabeerAuthPlatform_Public_RSA_Key);

        res.cookie(storageIndex.cookies.UserData, JSON.stringify(userinfo), {
            domain: config.FRONTEND_COOKIE_DOMAIN,
            maxAge: 7.2e+6 //tokenPayload.exp
        });
        res.cookie(storageIndex.cookies.Tokens, JSON.stringify(response), {
            domain: config.FRONTEND_COOKIE_DOMAIN,
            maxAge: 7.2e+6 // ~ 2 Hours
        });
        res.cookie(storageIndex.cookies.RefreshToken, refresh_token, {
            domain: config.FRONTEND_COOKIE_DOMAIN,
            maxAge: 7.2e+6 //tokenPayload.exp
        });

        res.redirect(config.FRONTEND_URL || "/");

    } catch (e) {
        console.log(e)
        return res.status(400).json(e.message);
    }
};
/**
 * Refresh Kabeer IDP Token
 * @deprecated
 * @param req
 * @param res
 * @returns {Promise<*>}
 * @constructor
 */
const RefreshToken = async (req, res) => {
    if (!req.cookies[storageIndex.cookies.RefreshToken]) return res.redirect(`${config.SELF_URL}/auth/redirect`);
    const refreshToken = req.cookies[storageIndex.cookies.RefreshToken];
    const tokenPayload = JSON.parse(Buffer.from(refreshToken.split(".")[1], "base64"));
    if (tokenPayload.iat > tokenPayload.exp) return res.redirect(`${config.SELF_URL}/auth/redirect`);
    try {
        const response = await axios({
            method: "post",
            url: `${config.K_AUTH_URL}/auth/oauth/v2/token`,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            data: serialize({
                "app_id": keys.app.app_public,
                "app_secret": keys.app.app_secret,
                "refresh_token": refreshToken,
                "grant_type": "refresh_token"
            })
        });
        const userinfo = await jwt.verify(response.data["id_token"], keys.KabeerAuthPlatform_Public_RSA_Key);
        res.cookie(storageIndex.cookies.UserData, JSON.stringify(userinfo), {
            domain: config.FRONTEND_COOKIE_DOMAIN,
        });
        res.cookie(storageIndex.cookies.Tokens, JSON.stringify({...response.data, refresh_token: refreshToken}), {
            domain: config.FRONTEND_COOKIE_DOMAIN,
            maxAge: 7.2e+6
        });
        res.cookie(storageIndex.cookies.RefreshToken, refreshToken, {
            domain: config.FRONTEND_COOKIE_DOMAIN,
            maxAge: tokenPayload.exp
        });
        req.query.redirect_uri ? res.redirect(req.query.redirect_uri) : res.json({
            expire: "1h",
            exp: response.data["expires_in"],
            tokens: response.data,
        });
    } catch (e) {
        console.log(e);
        return res.status(400).json(e.message);
    }
};
/**
 * Get Token For Data-Collection Microservice
 * @param req
 * @param res
 * @returns {Promise<*>}
 * @constructor
 */
const GetDataServerKey = async (req, res) => {
    if (!req.headers.authorization) return res.status(400).json("Bad Request");
    try {
        const key = req.headers.authorization;
        // TODO: add new Scopes to IDP and also require them during /redirect
        // const decoded = await jwt.verify(req.headers.authorization.split(" ")[1], keys.KabeerAuthPlatform_Public_RSA_Key, {
        //     algorithms: "RS256"
        // });
        // if (!decoded) return res.status(400).end();

        const token = await jwt.sign({
            sub: req.headers.authorization.split(" ")[1],
            scope: "__kn.music.data-collection.write-watch|__kn.music.data-collection.update-rating|__kn.music.data-collection.get-song|__kn.music.data-collection.get-rating-details",
        }, process.env.DATA_SERVER_TOKEN);
        return res.json({
            sub: req.headers.authorization.split(" ")[1],
            scope: "__kn.music.data-collection.write-watch|__kn.music.data-collection.update-rating|__kn.music.data-collection.get-song".split("|"),
            access_token: token,
        });
    } catch (e) {
        return res.status(400).json(e.message);
    }
}
/**
 * @deprecated
 * This was created for the old-Kabeer IDP - now we just add a id_token grant which has all the necessary details
 * @param req
 * @param res
 * @returns {Promise<*>}
 * @constructor
 */
const GetUserInfo = async (req, res) => {
    if (!req.cookies[storageIndex.cookies.Tokens]) return res.status(400).end();
    try {
        const id_token = JSON.parse(req.cookies[storageIndex.cookies.Tokens])['id_token'];
        const user_info = await axios.post(`${config.K_AUTH_URL}/user/userinfo`, serialize({
            token: id_token
        }), {
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        });
        res.json(user_info.data);
    } catch (e) {
        console.log(e)
        res.status(400).end();
    }
}
module.exports = {
    OAuthCallbackHandler,
    OAuthRedirect,
    RefreshToken,
    GetDataServerKey,
    GetUserInfo,
    GetAPIKey,
    // ServiceLogin,
};
