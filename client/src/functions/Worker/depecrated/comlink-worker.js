importScripts("https://unpkg.com/comlink/dist/umd/comlink.js");
importScripts("https://unpkg.com/fusejs@1.4.3/fuse.js");

const fusePrivates = {
    corpus: null,
    fuse: null,
    fuseOptions: null
};
const main = {
    fetch: (uri, config) => fetch(uri, config).then(r => r.ok ? r.json() : new Error("Type Error: Failed to fetch")),
    fuseSetup: async (data, options) => {
        fusePrivates.corpus = data;
        fusePrivates.fuseOptions = options;
        fusePrivates.fuse = new Fuse(data, options);
        return true;
    },
    fuseSearch: async (query) => fusePrivates.fuse.search(query),
    fuseSearchInstant: async (db, options, query) => {
        return new Fuse(db, options).search(query);
    }
};

Comlink.expose(main);
