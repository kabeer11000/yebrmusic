const h = process.env.HOSTNAME;
module.exports = {
    getPlayListById: (id) => `${h}api/backend/playlist?playlist=${id}`,
    searchYoutubeMultipleIds: (ids, maxResults = 5) => `${h}api/backend/search?q=${ids.join(" , ")}&maxResults=${maxResults}`,
    searchYotubeMultipleIdsFake: (ids, maxResults = 5) => "https://cdn.jsdelivr.net/gh/kabeer11000/sample-response/yt-api/videoIdSearch.json",
    searchYoutube: (q, maxResults = 5) => `${h}api/backend/search?q=${q}&maxResults=4`,
    searchYoutubeFake: (q, maxResults = 5) => `https://cdn.jsdelivr.net/gh/kabeer11000/sample-response/yt-api/search-result.json`,
    ytPlaylist: (playListId, maxResults = 5) => `https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&videoCategoryId=10&type=video&key=${youtube_key}&playlistId=${playListId}&maxResults=${maxResults}`
};
