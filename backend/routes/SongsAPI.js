const router = require("express").Router();
const songs = require("../controllers/SongsController");


router.get("/song", songs.getSong);
router.get("/song/details/:id", songs.getSongDetail);
router.get("/search", songs.searchSong);
router.get("/feed/search", songs.searchFeed);
router.get("/feed/topartist", songs.topArtist);
router.get("/feed/artists/all", songs.getArtists);
router.get("/feed/trending/artists", songs.topArtistsRanked);

module.exports = router;
// TODO Because you lisened to travis scott
// Record artist name to database for that user
// Search Yt for artist name
// Show Because You Listened to travis scott
