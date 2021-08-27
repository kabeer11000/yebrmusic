//export const hostName = `${window.location.protocol}//${window.location.host}`;

export const hostName = window.__kn.music.config.hosts["api"] || `${window.location.protocol}//${window.location.hostname}:9000`;
const proxy = window.__kn.music.config.hosts["proxy"] || "http://localhost:8080";
const CastServer = window.__kn.music.config.hosts["cast-server"] || "http://localhost:3240";
const DataCollection = window.__kn.music.config.hosts["data-collection-server"] || "http://localhost:80";

const endPoints = {
    castServer: CastServer,
    hostName: hostName,
    getUserData: `${hostName}/auth/user/data`,
    mostPopular: key => `https://www.googleapis.com/youtube/v3/videos?part=snippet&videoCategoryId=10&type=video&key=${key}&chart=mostPopular`,
    mostPopularFake: key => `${hostName}/files/yt-fake/sample-response-master/yt-api/yt.json`,
    //getVideo: (key, id) => `https://www.googleapis.com/youtube/v3/videos?part=snippet&id=${id}&key=${key}`,
    //getVideoFake: (key, id) => `https://cdn.jsdelivr.net/gh/kabeer11000/sample-response@master/yt-api/video-.json`,
    getProxyfiedURI: (id) => `${hostName}/api/song?id=${id}`,
    getSuggestion: (q) => "https://suggestqueries.google.com/complete/search?",
    getSuggestionFake: (q) => `${proxy}http://clients1.google.com/complete/search?hl=en&output=toolbar&q=${q}`,
    searchYoutube: (q) => `${hostName}/api/search?q=${q}`,
    searchYoutubeFake: (key, q) => `${hostName}/files/yt-fake/sample-response-master/yt-api/search-result.json`,
    proxyURI: (url) => `${proxy}${url}`,
    saveWatchHistory: `${hostName}/api/history/save`,
    saveSearchHistory: `${hostName}/api/search/save`,
    getFeed: () => `${hostName}/api/feed`,
    getFeedFake: () => `${hostName}/files/yt-fake/sample-response-master/yt-api/suggested-cardib.json`,
    authRedirect: `${hostName}/auth/redirect`,
    refreshToken: `${hostName}/auth/store/tokens/refresh`,
    getSearchFeed: () => `${hostName}/api/feed/search`,
    getTopArtistFeed: () => `${hostName}/api/feed/topartist`,
    getPlayListById: (id) => `${hostName}/api/backend/playlist?playlist=${id}`,
    getPlayListByIdSearchFallback: (id) => `${hostName}/api/backend/search?q=${id}&playListMode=true`,
    getFeedArtists: `${hostName}/api/feed/artists/all`,
    getArtistInfo: (id) => `${hostName}/backend/artist/${id}`,
    castURL: (userid, deviceid) => `${hostName}/cast/user/connect/${userid}/${deviceid}`,
    updateActiveDevices: `${hostName}/cast/user/devices/update`,
    unregisterDevice: `${hostName}/cast/user/devices/unregister`,
    sendCastPlay: `${hostName}/cast/user/devices/send`,
    sendCastPause: `${hostName}/cast/user/devices/pause`,
    castPingTest: `${hostName}/cast/user/devices/ping`,
    clientComSocket: `${hostName}/socket/com`,
    getSongDetail: (id) => `${hostName}/api/song/details/${id}`,
    getTrendingArtistsRanked: `${hostName}/api/feed/trending/artists`,

    Auth: {
        refreshToken: ({redirect_uri}) => `${hostName}/auth/store/tokens/refresh?redirect_uri=${redirect_uri}`
    },
    DataCollection: {
        saveSessionHistory: (token) => `${DataCollection}/api/history/save-session?token=${token}`,
        getToken: `${hostName}/auth/external/data-collection/generate`,
        rate: ({id, token}) => `${DataCollection}/api/update-rating?video_id=${id}&token=${token}`,
        details: {
            getStreams: (token) => `${DataCollection}/api/details/streams?token=${token}`,
        }
    },
    API: {
        RecentlyAdded: `${hostName}/api/feed/songs/recent`
    },
    Recommendations: {
        topSearched: `${hostName}/recommendation/feed/top-searched`,
        topArtist: `${hostName}/recommendation/feed/top-artist`,
        deprecated: {
            getRecommendations: `${hostName}/recommendation/feed/discover/deprecated/knn`
        }
    }
};
export default endPoints;
