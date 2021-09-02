importScripts("./worker-scripts/comlink.min.js", "./worker-scripts/fuse.js", "./worker-scripts/dexie.min.js", "https://naturalintelligence.github.io/fast-xml-parser/lib/parser.js");

const fusePrivates = {
    corpus: null,
    fuse: null,
    fuseOptions: null
};
const songsDB = new Dexie("KabeersMusic_Songs");
const historyDB = new Dexie("KabeersMusic_History");

historyDB["version"](10).stores({songs: "id, time, rating, thumbnail, channelTitle, title, tags"});
songsDB["version"](10).stores({songs: "&id, valid, time, rating"});

let interVal = null;
const main = {
    utils: {
        ImageLoader: {
            load: async (url) => fetch(url).then(res => res.blob()),
        },
        XML2JSON: async (xml) => {
            xml = new DOMParser().parseFromString(xml, "text/xml");
            // xml = parser.parse(xml);
            console.log(xml)
            // Create the return object
            var obj = {};

            if (xml.nodeType === 1) {
                // element
                // do attributes
                if (xml.attributes.length > 0) {
                    obj["attributes"] = {};
                    for (var j = 0; j < xml.attributes.length; j++) {
                        var attribute = xml.attributes.item(j);
                        obj["attributes"][attribute.nodeName] = attribute.nodeValue;
                    }
                }
            } else if (xml.nodeType === 3) {
                // text
                obj = xml.nodeValue;
            }

            // do children
            // If all text nodes inside, get concatenated text from them.
            var textNodes = [].slice.call(xml.childNodes).filter(function (node) {
                return node.nodeType === 3;
            });
            if (xml.hasChildNodes() && xml.childNodes.length === textNodes.length) {
                obj = [].slice.call(xml.childNodes).reduce(function (text, node) {
                    return text + node.nodeValue;
                }, "");
            } else if (xml.hasChildNodes()) {
                for (var i = 0; i < xml.childNodes.length; i++) {
                    var item = xml.childNodes.item(i);
                    var nodeName = item.nodeName;
                    if (typeof obj[nodeName] == "undefined") {
                        obj[nodeName] = xml2json(item);
                    } else {
                        if (typeof obj[nodeName].push == "undefined") {
                            var old = obj[nodeName];
                            obj[nodeName] = [];
                            obj[nodeName].push(old);
                        }
                        obj[nodeName].push(xml2json(item));
                    }
                }
            }
            return obj;
        }
    },
    JSON: JSON,
    // localStorage: localStorage,
    // sessionStorage: sessionStorage,
    fetch: (uri, config) => fetch(uri, config).then(r => r.ok ? r.json() : null),
    fetchNonJSON: (uri, config) => fetch(uri, config),

    fetchText: (uri, config) => fetch(uri, config).then(r => r.ok ? r.text() : null),
    fetchBlob: (uri, config) => fetch(uri, config).then(r => r.ok ? r.blob() : null),
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
                console.log(i);
                return cb(i / 100);
            }, 1000);
        },
        setInterval: setInterval,
        clearInterval: clearInterval,
        clearLoopInterval: () => interVal ? clearInterval(interVal) : undefined,
    }
};

Comlink.expose(main);
