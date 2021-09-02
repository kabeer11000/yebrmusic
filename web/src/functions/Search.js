import endPoints from "../api/EndPoints/EndPoints";
import xml2json from "./Helper/XMLToJSON";
import {comLinkWorker} from "./Worker/worker-export";

export const SuggestSearch = async (q, ...args) => {
    const response = await comLinkWorker.fetchText(endPoints.getSuggestionFake(q)); //.then(r => r.text());
    const xmlDoc = await xml2json(new DOMParser().parseFromString(response.toString(), "text/xml"));
    return xmlDoc.toplevel ? (xmlDoc.toplevel).CompleteSuggestion : [];
};

export const SearchYoutube = async (q, ...args) => {
    const token = window.__kn.music.serviceLoginToken;
    return await comLinkWorker.fetch(endPoints.searchYoutube(q), {
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": `Bearer ${token}`
        },
        // signal: abortController.signal
    });
};
