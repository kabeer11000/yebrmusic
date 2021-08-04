const {GetAPIKey} = require("../controllers/auth-handlers");
const router = require("express").Router();
const {
    GetUserInfo,
    GetDataServerKey,
    OAuthRedirect,
    RefreshToken,
    OAuthCallbackHandler,
    ServiceLogin
} = require("../controllers/auth-handlers");


// router.get("/callback", OAuthCallbackHandler);
// router.post("/service-login", ServiceLogin);
router.get("/redirect", OAuthRedirect);
router.post("/external/data-collection/generate", GetDataServerKey);
router.post("/service-login/browse/key", GetAPIKey);
// router.get("/user/data", GetUserInfo);
// router.get("/store/tokens/refresh", RefreshToken);

module.exports = router;
