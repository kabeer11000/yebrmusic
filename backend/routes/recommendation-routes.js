const router = require("express").Router();
const {RequestParser} = require("../functions/header-parser");
const {KnnRankedCandidates, GenerateCandidates, _GetCandidatesByUser, BasedOnLastSearches, BecauseYouListenedTo} = require("../controllers/recommendation-handlers");

router.post('/feed/discover/deprecated/knn', RequestParser.Optional, KnnRankedCandidates);
router.get("/generate-candidates", GenerateCandidates);
router.get('/tests/get-candidates/:user_id', _GetCandidatesByUser);

router.get("/feed/top-searched", RequestParser.Optional, BasedOnLastSearches);
router.get("/feed/top-artist", RequestParser.Optional, BecauseYouListenedTo);

module.exports = router;
