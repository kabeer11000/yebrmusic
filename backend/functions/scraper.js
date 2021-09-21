const ytSearch = require("yt-search");
const uuid = require("uuid");
const ytPlaylist = require("ytpl");
const axios = require("axios");
/**
 * GetSong Details By Id
 * @param id
 * @returns {Promise<{snippet: {duration: *, publishedAt: *, description: *, id: *, title: *, thumbnails: {default: {width: number, url: string, height: number}, high: {width: number, url: string, height: number}, medium: {width: number, url: string, height: number}}, channelId: *, views: *, channelTitle}, kind: string, etag: string, id: *, channelId: *}>}
 */
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

const _search_ytsr = async (query, options = {}) => {
    const ytsr = require("ytsr");
    const results = await ytsr(query, options);
    const filtered_results = results.items.filter(video => video.type === "video");
    return ({
        kind: "KabeersMusic#searchListResponse",
        etag: uuid.v4(),
        regionCode: "PK",
        pageInfo: {
            totalResults: filtered_results.length,
        },
        items: filtered_results.map(video => ({
            kind: "KabeersMusic#Song",
            etag: uuid.v4(),
            id: video.id,
            channelId: video.author.channelId,
            author: {
                badges: video.author.ownerBadges,
                verified: video.author.verified
            },
            snippet: {
                publishedAt: video.ago,
                title: video.title,
                description: video.description,
                channelTitle: video.author.name || "From Kabeer's Music",
                channelId: video.author.channelId,
                duration: video.duration,
                views: video.views,
                thumbnails: {
                    default: {
                        url: `https://i.ytimg.com/vi/${video.id}/default.jpg`,
                        width: 120,
                        height: 90
                    },
                    medium: {
                        url: `https://i.ytimg.com/vi/${video.id}/mqdefault.jpg`,
                        width: 320,
                        height: 180
                    },
                    high: {
                        url: `https://i.ytimg.com/vi/${video.id}/hqdefault.jpg`,
                        width: 480,
                        height: 360
                    }
                }
            }
        })),
        accounts: filtered_results.map(({author}) => ({
            image: author.bestAvatar.url,
            name: author.name,
            thumbnail: author.bestAvatar.url,
            title: author.name,
            type: "channel",
            url: author.url,
            badges: author.ownerBadges,
            verified: author.verified
        })),
        title: query
    })
}
/**
 * Search Youtube
 * @param query
 * @returns {Promise<{regionCode: string, kind: string, pageInfo: {totalResults: *}, etag: string, accounts: *, title: *, items: *}>}
 */
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
/**
 * Get Playlist By ID
 * @param id
 * @returns {Promise<{last_updated: *, visibility: *, kind: string, author: {name: *, user_url: *, id: *, avatar: *, user: *, channel_url: *}, description: *, id: *, title: *, total_items: *, items: *, url: *, views: *}>}
 */
const getPlayList = async (id) => ytPlaylist(id).then(list => ({
    kind: "KabeersMusic#PlayList",
    id: list.id,
    url: list.url,
    title: list.title,
    visibility: list.visibility,
    description: list.description,
    total_items: list.total_items,
    views: list.views,
    last_updated: list.last_updated,
    author: {
        id: list.author?.id,
        name: list.author?.name,
        avatar: list.author?.avatar,
        user: list.author?.user,
        channel_url: list.author?.channel_url,
        user_url: list.author?.user_url
    },
    items: list.items.map(video => ({
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
                    url: `https://i.ytimg.com/vi/${video.id}/default.jpg`,
                    width: 120,
                    height: 90
                },
                medium: {
                    url: `https://i.ytimg.com/vi/${video.id}/mqdefault.jpg`,
                    width: 320,
                    height: 180
                },
                high: {
                    url: `https://i.ytimg.com/vi/${video.id}/hqdefault.jpg`,
                    width: 480,
                    height: 360
                }
            }
        }
    }))
}));
const IDResolver = `https://docs.kabeercloud.tk/yebr/resolve-yt-channel-id.php`;
/**
 * Get Artist
 * @param id
 * @returns {Promise<{visibility: "unlisted" | "everyone", author: {bestAvatar: Image, name: string, avatar: string, url: string, channelID: string, avatars: Image[]}, description: string | null, bestThumbnail: Image, title: string, url: string, lastUpdated: string, estimatedItemCount: number, id: string, thumbnails: Image[], items: {snippet: {duration: *, publishTime: string, publishedAt: *, description: *, id: *, title: *, thumbnails: {default: {width: number, url: string, height: number}, high: {width: number, url: string, height: number}, medium: {width: number, url: string, height: number}}, channelVerified: *, channelId: *, channelTitle: *, liveBroadcastContent: *}, kind: string, etag: string, id: *}[], continuation: Continuation | null, views: number}|*>}
 */
const getArtist = async (id) => {
    try {
        // console.log(await axios({
        //     method: "POST",
        //     url: IDResolver,
        //     data: JSON.stringify({u: `https://www.youtube.com/${id}`})}).then(res => res.data))
        // if (id.length < 24) id = await axios({method: "POST",url: "https://docs.kabeercloud.tk/yebr/resolve-yt-channel-id.php",data: JSON.stringify({u: `https://www.youtube.com/${id}`})})
        const channel = await ytPlaylist(`https://www.youtube.com/channel/${await id.length !== 24 ? await axios({
            method: "POST",
            url: IDResolver,
            data: JSON.stringify({u: `https://www.youtube.com/${id}`})
        }).then(res => res.data) : id}`);
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
        console.log(e)
        return e
    }
};
module.exports = {
    searchYoutube,
    getSong,
    getPlayList,
    getArtist,

    experimental: {
        _search_ytsr
    }
};
