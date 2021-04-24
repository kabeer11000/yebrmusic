const router = require("express").Router();
const handler = require("../controllers/api-handlers");
const scraper = require("../functions/scraper");

router.get("/song", handler.getSong);
router.get("/song/details/:id", handler.getSongDetail);
router.get("/search", handler.searchSong);
router.get("/feed/artists/all", handler.AllArtistsChips);
router.get("/feed/trending/artists", handler.topArtistsRanked);
router.get("/feed/songs/recent", async (req, res) => {
    const response = await scraper.getPlayList("PLkqz3S84Tw-TGS_ltn3Yu_4JQAulJqXrL");
    res.json({
        ...response,
        title: "Recently Added"
    })
});

router.get("/pornography", async (req, res) => {
    const a = await scraper.experimental._search_ytsr("justin bieber", {
        limit: 20
    });
    res.json(a)
});
/**
 * Uses:
 * 1) Get Cloudflare GEO-API headers to get users location
 */
router.get("/utility/generate_200", async (req, res) => res.status(200).end());

module.exports = router;
