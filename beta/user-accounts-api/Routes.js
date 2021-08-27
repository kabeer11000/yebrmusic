const Accounts = require("./Controllers/Accounts");
const router = require("express").Router();

router.get("/account/create/new", Accounts.CreateChannel);
router.get("/channel/get/:channelId", Accounts.GetChannel);
module.exports = router;
