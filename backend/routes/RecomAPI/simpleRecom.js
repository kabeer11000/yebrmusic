const mongo_uri = require("../../keys/mongokey");
const MongoClient = require("mongodb").connect(mongo_uri, {
	useNewUrlParser: true,
	useUnifiedTopology: true
}).then(db => db.db("music")); // Mongodb Client so i just await MongoClient
const router = require("express").Router();
// const {searchWeb} = require("../../functions/meta-data");
// const yts = require("yt-search");
// const keys = require("../../keys/keys");
const yts = require("yt-search");
// const ytfps = require("ytfps");
// const ytpl = require("ytpl");
const scraper = require("../../functions/scraper");
router.get("/", (req, res) => {
	MongoClient.then(async (dbo) => {
		if (!dbo) return res.status(500).json("Internal Server Error");
		dbo.collection("history")
			.find({
				user_id: "b4000376114184b38e2f00e43b070a9fe239457d",
				type: "watchHistory",
			})
			.sort({timeStamp: -1}).limit(10).toArray()
			.then((results) => {
				/*
					Results .map push to seprate array for keywords and video ids
				 */

				const historyKeywords = results.map((object, index) => ({
					videoId: object.video_id,
					keyWords: object.video_keywords
				})).flat().filter((item, pos, self) => self.indexOf(item) === pos);
				dbo.collection("history").find({
					// TODO uncomment karnay par us user ki history nahi check karay ga
					/*
					user_id: {
						$not: {
							$gt: "b4000376114184b38e2f00e43b070a9fe239457d",
						}
					},
					video_id: {
						$not: {
							$in: [...historyKeywords.map(video => video.videoId)],
						}
					},
					*/
					type: "watchHistory",
					video_keywords: {
						$elemMatch: {
							$in: [...historyKeywords.map(video => video.keyWords)].flat() // Fatten Array
						}
					}
				}).sort({timeStamp: -1}).limit(10).toArray()
					.then(recom => recom ? (
						res.json(
							recom.map(v => v.artist_name)
						)
					) : res.json("Nothing Found"))
					.catch(e => res.json(e));
			}).catch(e => res.json(e));
	}).catch(e => res.json(e));
});
router.get("/search", async (req, res) => {
	const response = await yts({query: req.query.q});
	const videos = response.videos.map(video => ({
		title: video.title,
		description: video.description,
		duration: video.seconds,
		channel: video.author.name
	}));
	res.json(videos);
});
router.get("/history", async (req, res) => {
	const db = await MongoClient;
	const response = await db.collection("history").find({
		type: "listeningHistory",
		user_id: "SD6YoQaxbvSMrXkHuXWQM9kjgcJuYN4aCQNbc8jA"
	}).sort({_id: 1}).skip(req.query.skip ? parseInt(req.query.skip) : 0).limit(req.query.limit ? parseInt(req.query.limit) : 10).toArray();
	res.json(response.map(h => ({
		...h.song,
		channelId: undefined
	})));
});
router.get("/video/:id", async (req, res) => {
	const video = await yts({videoId: req.params.id});
	res.json([
		{
			title: video.title,
			id: video.videoId,
			description: video.description,
			runtime: video.duration.seconds,
			channel: video.author.name
			// title: video.title,
			// id: video.videoId,
			// runtime: video.seconds,

			// description: video.description,
			// duration: video.seconds,
			// channel: video.author.name
		}
	]);
});
router.get("/search/:q", async (req, res) => {
	const response = await yts({query: req.params.q});
	console.log(response["videos"][0])
	const videos = response.videos.map(video => ({
		"kind": "KabeersMusic#Song",
		"etag": "f88d36d8-b0c9-4c58-b90f-5b2b2def151b",
		"id": "d-JBBNg8YKs",
		"channelId": "UCtxdfwb9wfkoGocVUAJ-Bmg",
		"snippet": {
			"publishedAt": "2 years ago",
			"title": "Travis Scott - SICKO MODE (Audio)",
			"description": "\"SICKO MODE\" by Travis Scott\nListen to Travis Scott: https://TravisScott.lnk.to/listenYD\u200b\n\nSubscribe to the official Travis Scott YouTube channel: https://TravisScott.lnk.to/subscribeYD\u200b\n\nWatch more Travis Scott videos: https://TravisScott.lnk.to/listenYD/y...\u200b\n\nFollow Travis Scott:\nFacebook: https://TravisScott.lnk.to/followFI\u200b\nInstagram: https://TravisScott.lnk.to/followII\u200b\nTwitter: https://TravisScott.lnk.to/followTI\u200b\nWebsite: https://TravisScott.lnk.to/followWI\u200b\nSpotify: https://TravisScott.lnk.to/followSI\u200b\nYouTube: https://TravisScott.lnk.to/subscribeYD\u200b\n\nLyrics:\nShe's in love with who I am\nBack in high school, I used to bus it to the dance\nNow I hit the FBO with duffels in my hands (Woo)\nI did half a Xan, 13 hours 'til I land\nHad me out like a light (Like a light)\nLike a light (Like a light)\nLike a light (Like a light)\nLike a light\n\n#TravisScott\u200b #SICKOMODE\u200b #OfficialAudio\u200b",
			"id": "d-JBBNg8YKs",
			"channelTitle": "Travis Scott",
			"channelId": "UCtxdfwb9wfkoGocVUAJ-Bmg",
			"duration": {"seconds": 314, "timestamp": "5:14"},
			"views": 232937418,
			"thumbnails": {
				"default": {"url": "https://i.ytimg.com/vi/d-JBBNg8YKs/default.jpg", "width": 120, "height": 90},
				"medium": {"url": "https://i.ytimg.com/vi/d-JBBNg8YKs/mqdefault.jpg", "width": 320, "height": 180},
				"high": {"url": "https://i.ytimg.com/vi/d-JBBNg8YKs/hqdefault.jpg", "width": 480, "height": 360}
			}
		}
	}));
	res.json(videos);
});
router.get("/playlist/:id", async (req, res) => {
	const response = await yts({listId: req.params.id});
	const videos = response.videos.map(video => ({
		title: video.title,
		id: video.videoId,
		description: video.description,
		runtime: video.duration.seconds,
		channel: video.author.name
	}));
	res.json(videos);
});
router.get("/concat/playlist/:ids", async (req, res) => {
	let response = [];
	const ids = req.params.ids.split("|");

	for (const id of ids) {
		// console.log(await scraper.getPlayList(id))
		const videos = await yts({listId: id}).then(r => {
			return r.videos.map(video => ({
				title: video.title,
				id: video.videoId,
				description: video.description,
				runtime: video.duration.seconds,
				channel: video.author.name
			}));
		});
		response = [...response, ...videos];
	}
	return res.json(response);
});
router.get("/schema/video/:id", async (req, res) => res.json(await scraper.getSong(req.params.id)));
router.get("/aa/:ids", async (req, res) => {
	// const videos = await ytpl("RDCLAK5uy_nhf3h98yS3LCk_bVNQu6GjWG7ARvMaiFQ");
	const videos = await yts({listId: "RDCLAK5uy_nhf3h98yS3LCk_bVNQu6GjWG7ARvMaiFQ"});
	res.json(videos);
});
module.exports = router;
/*
				.find({type: "watchHistory", "video_keywords": {$elemMatch: {$elemMatch: {$in: ["carrot"]}}}})
				.find({type: "watchHistory"}).toArray();

 */
