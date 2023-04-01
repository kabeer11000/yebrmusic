import * as Comlink from "comlink";

export const comLinkWorker = Comlink.wrap(new Worker("./comlink-worker.js"));
