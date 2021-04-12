importScripts("./worker-scripts/comlink.min.js", "./worker-scripts/fuse.js", "./worker-scripts/dexie.min.js");

const fusePrivates = {
    corpus: null,
    fuse: null,
    fuseOptions: null
};
const songsDB = new Dexie("KabeersMusic_Songs");
const historyDB = new Dexie("KabeersMusic_History");

historyDB["version"](10).stores({songs: "id, time, rating, thumbnail, channelTitle, title, tags"});
songsDB["version"](10).stores({songs: "&id, valid, time, rating"});

let interVal = null
const main = {
    JSON: JSON,
    // localStorage: localStorage,
    // sessionStorage: sessionStorage,
    fetch: (uri, config) => fetch(uri, config).then(r => r.ok ? r.json() : null),
    fetchNonJSON: (uri, config) => fetch(uri, config),
    fuseSetup: async (data, options) => {
        fusePrivates.corpus = data;
        fusePrivates.fuseOptions = options;
        fusePrivates.fuse = new Fuse(data, options);
        return true;
    },
    fuseSearch: async (query) => fusePrivates.fuse.search(query),
    fuseSearchInstant: async (db, options, query) => new Fuse(db, options).search(query),
    indexedDB: {
        history: {
            toArray: () => historyDB["songs"].toArray(),
            get: (key) => historyDB["songs"].get(key),
            put: (config) => historyDB["songs"].put(config),
            delete: (id) => historyDB["songs"].delete(id)
        },
        songs: {
            toArray: () => songsDB["songs"].toArray(),
            find: async (queryFunction) => {
                const songs = await songsDB["songs"].toArray();
                return songs.find(queryFunction);
            },
            findById: async (id) => {
                const songs = await songsDB["songs"].toArray();
                return songs.find(v => v.id === id);
            },
            findByVideoId: async (id) => {
                const songs = await songsDB["songs"].toArray();
                return songs.find(v => v.id === id);
            },
            get: (key) => songsDB["songs"].get(key),
            put: (config) => songsDB["songs"].put(config),
            delete: async (id) => await songsDB["songs"].delete(id)
        },
    },
    intervals: {
        makeAudioPanning: (cb) => {
            let direction = 10;
            let i = 0;

            interVal = setInterval(() => {
                /*
					if (i === 100) {
						return  -10;
					} else if (i === 0) {
						return 10;
					} else return direction
				*/

                direction = i === 100 ? -10 : i === 0 ? 10 : direction;
                i += direction;
                console.log(i)
                return cb(i / 100);
            }, 1000)
        },
        setInterval: setInterval,
        clearInterval: clearInterval,
        clearLoopInterval: () => interVal ? clearInterval(interVal) : undefined,
    }
};

Comlink.expose(main);
