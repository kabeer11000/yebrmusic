const router = require("express").Router();
const scraper = require("../functions/scraper");

router.get("/video/details/:id", async (req, res) => res.json(await scraper.getSong(req.params.id)));
router.get("/playlist/details/:id", async (req, res) => res.json(await scraper.getPlayList(req.params.id)));
router.get("/search/:q", async (req, res) => res.json(await scraper.searchYoutube(req.params.q)));
router.get("/artist/:id", async (req, res) => res.json(await scraper.getArtist(req.params.id)));

module.exports = router;
