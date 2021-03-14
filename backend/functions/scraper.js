const ytSearch = require("yt-search");
const uuid = require("uuid");
const ytPlaylist = require("ytpl");

const getSong = async (id) => ytSearch({videoId: id})
    .then(video => ({
        kind: "KabeersMusic#Song",
        etag: uuid.v4(),
        id: video.videoId,
        channelId: video.author.url.split("/")[4],
        snippet: {
            publishedAt: video.ago,
            title: video.title,
            description: video.description,
            id: video.videoId,
            channelTitle: video.author.name || "From Kabeers Music",
            channelId: video.author.url.split("/")[4],
            duration: video.duration,
            views: video.views,
            thumbnails: {
                default: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/default.jpg`,
                    width: 120,
                    height: 90
                },
                medium: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/mqdefault.jpg`,
                    width: 320,
                    height: 180
                },
                high: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/hqdefault.jpg`,
                    width: 480,
                    height: 360
                }
            }
        }
    }));


const searchYoutube = async (query) => ytSearch({query: query}).then(videos => ({
    kind: "KabeersMusic#searchListResponse",
    etag: uuid.v4(),
    regionCode: "PK",
    pageInfo: {
        totalResults: videos.videos.length,
    },
    items: videos.videos.map(video => ({
        kind: "KabeersMusic#Song",
        etag: uuid.v4(),
        id: video.videoId,
        channelId: video.author.url.split("/")[4],
        snippet: {
            publishedAt: video.ago,
            title: video.title,
            description: video.description,
            channelTitle: video.author.name || "From Kabeers Music",
            channelId: video.author.url.split("/")[4],
            duration: video.duration,
            views: video.views,
            thumbnails: {
                default: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/default.jpg`,
                    width: 120,
                    height: 90
                },
                medium: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/mqdefault.jpg`,
                    width: 320,
                    height: 180
                },
                high: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/hqdefault.jpg`,
                    width: 480,
                    height: 360
                }
            }
        }
    })),
    accounts: videos.channels,
    title: query
}));
const getPlayList = async (id) => ytPlaylist(id).then(list => ({
    id: list.id,
    url: list.url,
    title: list.title,
    visibility: list.visibility,
    description: list.description,
    total_items: list.total_items,
    views: list.views,
    last_updated: list.last_updated,
    author: {
        id: list.author.id,
        name: list.author.name,
        avatar: list.author.avatar,
        user: list.author.user,
        channel_url: list.author.channel_url,
        user_url: list.author.user_url
    },
    items: list.videos.map(video => ({
        kind: "KabeersMusic#Song",
        id: video.id,
        channelId: video.author.url.split("/")[4],
        snippet: {
            publishedAt: video.ago,
            title: video.title,
            description: video.description,
            channelTitle: video.author.name || "From Kabeers Music",
            channelId: video.author.url.split("/")[4],
            duration: video.duration,
            views: video.views,
            thumbnails: {
                default: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/default.jpg`,
                    width: 120,
                    height: 90
                },
                medium: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/mqdefault.jpg`,
                    width: 320,
                    height: 180
                },
                high: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/hqdefault.jpg`,
                    width: 480,
                    height: 360
                }
            }
        }
    }))
}));
const __getPlayList___YTS = async (id) => ytSearch({listId: id}).then(list => ({
    id: list.id,
    url: list.url,
    title: list.title,
    visibility: list.visibility,
    description: list.description,
    total_items: list.total_items,
    views: list.views,
    last_updated: list.last_updated,
    author: {
        id: list.author.id,
        name: list.author.name,
        avatar: list.author.avatar,
        user: list.author.user,
        channel_url: list.author.channel_url,
        user_url: list.author.user_url
    },
    items: list.videos.map(video => ({
        kind: "KabeersMusic#Song",
        etag: uuid.v4(),
        id: video.videoId,
        channelId: video.author.url.split("/")[4],
        snippet: {
            publishedAt: video.ago,
            title: video.title,
            description: video.description,
            channelTitle: video.author.name || "From Kabeers Music",
            channelId: video.author.url.split("/")[4],
            duration: video.duration,
            views: video.views,
            thumbnails: {
                default: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/default.jpg`,
                    width: 120,
                    height: 90
                },
                medium: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/mqdefault.jpg`,
                    width: 320,
                    height: 180
                },
                high: {
                    url: `https://i.ytimg.com/vi/${video.videoId}/hqdefault.jpg`,
                    width: 480,
                    height: 360
                }
            }
        }
    }))
}));
const getArtist = async (id) => {
    try {
        const channel = await ytPlaylist(`https://www.youtube.com/channel/${id}`);
        return ({
            ...channel,
            author: {
                ...channel.author,
                avatar: channel.author.bestAvatar.url
            },
            items: channel.items.map(video => {
                return ({
                    kind: "KabeersMusic#Song",
                    etag: uuid.v4(),
                    id: video.id,
                    snippet: {
                        id: video.id,
                        publishedAt: video.uploaded_at,
                        channelId: video.author.channelId,
                        channelVerified: video.author.verified,
                        title: video.title,
                        description: video.description,
                        duration: video.durationSec,
                        thumbnails: {
                            "default": {
                                "url": `https://i.ytimg.com/vi/${video.id}/default.jpg`,
                                "width": 120,
                                "height": 90
                            },
                            "medium": {
                                "url": `https://i.ytimg.com/vi/${video.id}/mqdefault.jpg`,
                                "width": 320,
                                "height": 180
                            },
                            "high": {
                                "url": `https://i.ytimg.com/vi/${video.id}/hqdefault.jpg`,
                                "width": 480,
                                "height": 360
                            }
                        },
                        channelTitle: video.author.name,
                        liveBroadcastContent: video.live,
                        "publishTime": "2020-08-22T04:00:05Z"
                    }
                });
            })
        });
    } catch (e) {
        return e
    }
};
module.exports = {
    searchYoutube,
    getSong,
    getPlayList,
    getArtist
};
