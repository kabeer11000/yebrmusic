import {FetchBlob} from "./Blob";
import endPoints from "../api/EndPoints/EndPoints";
import {v4} from "uuid";
import {comLinkWorker as WebWorker} from "./Worker/worker-export";

export const DownloadSong = async ({song, uri, rating}) => WebWorker.indexedDB.songs.put({
	id: song.id,
	blobs: {
		thumbnail: await FetchBlob(endPoints.proxyURI(`https://i.ytimg.com/vi/${song.id}/hqdefault.jpg`)),
		audio: await FetchBlob(uri)
	},
	valid: true,
	time: Date.now(),
	rating: rating || 0,
	videoElement: song
});
export const deleteDownloadedSong = (videoId) => WebWorker.indexedDB.songs.delete(videoId);
export const getBlob = (key) => WebWorker.indexedDB.songs.get(key);
export const getSong = async (id) => {
	const token = window.__kn.music.serviceLoginToken;
	if (!token) return new Error("No Token");
	if (!navigator.onLine) return new Error("No Connection");
	return await WebWorker.fetch(endPoints.getProxyfiedURI(id), {
		// method: "POST",
		headers: {
			"Authorization": `Bearer ${token}`
		}
	});
};
export const getSongDetails = async (id) => {
	const token = window.__kn.music.serviceLoginToken;
	if (!token) return new Error("No Token");
	if (!navigator.onLine) return new Error("No Connection");
	return await WebWorker.fetch(endPoints.getSongDetail(id), {
		// method: "POST",
		headers: {
			"Authorization": `Bearer ${token}`
		}
	});
};
export const getSongFromStorage = async (id) => {
	const song = await WebWorker.indexedDB.songs.findByVideoId(id);
	song.videoElement.snippet.thumbnails.high.url = URL.createObjectURL(song.blobs.thumbnail);
	return ({
		...song,
		isOffline: true
	});
};
export const getAllDownloadedSongs = () => WebWorker.indexedDB.songs.toArray();
export const SuggestOfflineSongs = async (s) => {
	const songs = (await WebWorker.indexedDB.songs.toArray()).map(song => {
		song.videoElement.snippet.thumbnails.high.url = URL.createObjectURL(song.blobs.thumbnail);
		return song;
	});
	const options = {
		isCaseSensitive: false,
		shouldSort: false,
		threshold: 0.6,
		ignoreLocation: true,
		useExtendedSearch: true,
		findAllMatches: true,
		keys: [
			"videoElement.snippet.title",
			"videoElement.snippet.channelTitle",
			{
				name: "videoElement.snippet.title",
				weight: 1.5
			},
			{
				name: "videoElement.snippet.channelTitle",
				weight: 1.0
			},
		]
	};
	return await WebWorker.fuseSearchInstant(songs, options, s);
};
export const isOfflineAvailable = (id) => WebWorker.indexedDB.songs.findById(id);
export const saveToHistory = (object) => WebWorker.indexedDB.history.put({
	id: v4(),
	title: object.title,
	channelTitle: object.ChannelTitle,
	tags: object.tags,
	thumbnail: object.thumbnail,
	time: Date.now(),
	rating: object.rating,
});
const DownloadsWithThumbnails = async () => {
	return (await WebWorker.indexedDB.songs.toArray()).map(song => {
		song.videoElement.snippet.thumbnails.high.url = URL.createObjectURL(song.blobs.thumbnail);
		return song;
	});
};
export const getHistory = () => WebWorker.indexedDB.history.toArray();
export const getFeed = () => WebWorker.indexedDB.songs.toArray();
export const downloadsToPlaylist = async () => {
	const downloads = await DownloadsWithThumbnails();
	const items = [];
	downloads.map(song => items.push({
		...song,
		isOffline: true
	}));
	return {
		"kind": "KabeersMusic#searchListResponse",
		"etag": v4(),
		"regionCode": "PK",
		"pageInfo": {
			"totalResults": items.length,
		},
		"items": items,
	};
};
