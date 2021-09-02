const router = require("express").Router();
const handler = require("../controllers/api-handlers");
const {RequestParser} = require("../functions/header-parser");

router.get("/song", RequestParser.Optional, handler.getSong);
router.get("/song/details/:id", RequestParser.Optional, handler.getSongDetail);
router.get("/search", RequestParser.Optional, handler.searchSong);
router.get("/feed/artists/all", RequestParser.Optional, handler.AllArtistsChips);
router.get("/feed/trending/artists", RequestParser.Strict, handler.topArtistsRanked);
router.get("/feed/songs/recent", RequestParser.Optional, handler.GetRecentlyAdded);
router.get("/history", RequestParser.Strict, handler.GetHistory);
/**
 * Uses:
 * 1) Get Cloudflare GEO-API headers to get users location
 */
router.get("/utility/generate_200", async (req, res) => res.status(200).end());

module.exports = router;
