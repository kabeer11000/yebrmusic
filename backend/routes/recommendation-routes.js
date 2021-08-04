const router = require("express").Router();
const APIAuthVerifier = require("../functions/api-header-verifier");
const {KnnRankedCandidates, GenerateCandidates, _GetCandidatesByUser, BasedOnLastSearches, BecauseYouListenedTo} = require("../controllers/recommendation-handlers");

router.post('/feed/discover/deprecated/knn', APIAuthVerifier, KnnRankedCandidates);
router.get("/generate-candidates", GenerateCandidates);
router.get('/tests/get-candidates/:user_id', _GetCandidatesByUser);

router.get("/feed/top-searched", APIAuthVerifier, BasedOnLastSearches);
router.get("/feed/top-artist", APIAuthVerifier, BecauseYouListenedTo);

module.exports = router;
