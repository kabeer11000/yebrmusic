const router = require("express").Router();
const handler = require("../controllers/api-handlers");

router.get("/song", handler.getSong);
router.get("/song/details/:id", handler.getSongDetail);
router.get("/search", handler.searchSong);
router.get("/feed/artists/all", handler.AllArtistsChips);
router.get("/feed/trending/artists", handler.topArtistsRanked);
router.get("/feed/songs/recent", handler.GetRecentlyAdded);
/**
 * Uses:
 * 1) Get Cloudflare GEO-API headers to get users location
 */
router.get("/utility/generate_200", async (req, res) => res.status(200).end());

module.exports = router;
