const router = require("express").Router();
const {
    GetUserInfo,
    GetDataServerKey,
    OAuthRedirect,
    RefreshToken,
    OAuthCallbackHandler
} = require("../controllers/auth-handlers");


router.get("/callback", OAuthCallbackHandler);
router.get("/redirect", OAuthRedirect);
router.post("/external/data-collection/generate", GetDataServerKey);
router.get("/user/data", GetUserInfo);
router.get("/store/tokens/refresh", RefreshToken);

module.exports = router;
