const h = process.env.HOSTNAME;
const misc = require('../functions/misc');

module.exports = {
    getPlayListById: (id) => `${h}api/backend/playlist?playlist=${id}`,
    searchYoutubeMultipleIds: (ids, maxResults = 5) => `${h}api/backend/search?q=${ids.join(" , ")}&maxResults=${maxResults}`,
    searchYotubeMultipleIdsFake: (ids, maxResults = 5) => "https://cdn.jsdelivr.net/gh/kabeer11000/sample-response/yt-api/videoIdSearch.json",
    searchYoutube: (q, maxResults = 5) => `${h}api/backend/search?q=${q}&maxResults=4`,
    searchYoutubeFake: (q, maxResults = 5) => `https://cdn.jsdelivr.net/gh/kabeer11000/sample-response/yt-api/search-result.json`,
    ytPlaylist: (playListId, maxResults = 5) => `https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&videoCategoryId=10&type=video&key=${youtube_key}&playlistId=${playListId}&maxResults=${maxResults}`,

    DataCollectionServer: {
        /**
         *
         * @param id - user_id
         * @returns {string}
         * @constructor
         */
        GetSearchHistoryById: (id) => `${process.env.DATA_COLLECTION_SERVER}/api/history/get-search-history?user_id=${id}`,
        /**
         *
         * @param config
         * @returns {string}
         * @constructor
         */
        GetWatchHistoryById: (config = {user_id: "",}) => `${process.env.DATA_COLLECTION_SERVER}/api/history/get-history?${misc.serialize(config)}`,
        /**
         *
         * @param id
         * @returns {string}
         * @constructor
         */
        SaveSearchImpression: (id) => `${process.env.DATA_COLLECTION_SERVER}/api/history/save-search?user_id=${id}`,
        IndexSong: `${process.env.DATA_COLLECTION_SERVER}api/index-song`
    },
    RecommendationServer: {
        KnnRankedCandidates: `${process.env.RECOMMENDATION_SERVER_URI}/feed/recommendations/deprecated/knn`,
        GetAllCandidates: `${process.env.RECOMMENDATION_SERVER_URI}/next-song-prediction/get-all-predictions`
    }
};
