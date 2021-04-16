const router = require("express").Router();
const {KnnRankedCandidates, GenerateCandidates, _GetCandidatesByUser, BasedOnLastSearches, BecauseYouListenedTo} = require("../controllers/recommendation-handlers");

router.post('/feed/discover/deprecated/knn', KnnRankedCandidates);
router.get("/generate-candidates", GenerateCandidates);
router.get('/tests/get-candidates/:user_id', _GetCandidatesByUser);

router.get("/feed/top-searched", BasedOnLastSearches);
router.get("/feed/top-artist", BecauseYouListenedTo);

module.exports = router;
