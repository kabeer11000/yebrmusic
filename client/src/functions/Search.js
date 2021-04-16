import endPoints from "../api/EndPoints/EndPoints";
import xml2json from "./Helper/XMLToJSON";
import {initAuth} from "./Auth";

export const SuggestSearch = async (q, abortController = new AbortController()) => {
	const response = await fetch(endPoints.getSuggestionFake(q), {signal: abortController.signal}).then(r => r.text());
	const xmlDoc = xml2json(new DOMParser().parseFromString(response, "text/xml"));
	return xmlDoc.toplevel ? xmlDoc.toplevel.CompleteSuggestion : [];
}

export const SearchYoutube = async (q, abortController = new AbortController()) => {
	return initAuth()
		.then(token => fetch(endPoints.searchYoutube(q), {
			headers: new Headers({
				"Content-Type": "application/x-www-form-urlencoded",
				"Authorization": `Bearer ${token}`
			}),
			signal: abortController.signal
		}).then(r => r.json())).catch(e => e);
}
