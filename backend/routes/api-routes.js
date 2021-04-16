const router = require("express").Router();
const handler = require("../controllers/api-handlers");

router.get("/song", handler.getSong);
router.get("/song/details/:id", handler.getSongDetail);
router.get("/search", handler.searchSong);
// router.get("/feed/search", handler.searchFeed);
// router.get("/feed/topartist", handler.topArtist);
router.get("/feed/artists/all", handler.AllArtistsChips);
router.get("/feed/trending/artists", handler.topArtistsRanked);
router.get("/feed/discover", handler.Discover);

module.exports = router;
