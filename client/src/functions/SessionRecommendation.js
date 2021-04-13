import {storageIndex} from "./Helper/StorageIndex";
import Log, {DebugLog} from "./Log";
import {get, set, update} from "idb-keyval";
import {comLinkWorker} from "./Worker/worker-export";
import endPoints from "../api/EndPoints/EndPoints";
import {initAuth} from "./Auth";

class _SessionRecommendation {
    constructor() {
        this.init();
    }

    async _onUpdate() {
        try {
            const sessionHistory = await get(storageIndex.recommendation.sessionHistory);
            await comLinkWorker.fetch(endPoints.DataCollection.saveSessionHistory, {
                method: "POST",
                body: await comLinkWorker.JSON.stringify({
                    session: sessionHistory
                })
            });
        } catch (e) {
            DebugLog("Error: ", "Saved Session");
        }
    }

    async init() {

        const sessionId = await sessionStorage.getItem(storageIndex.recommendation.sessionId);
        const sessionHistory = await get(storageIndex.recommendation.sessionHistory);
        if (!sessionId) {
            Log("Creating New Recommendation Session");
            const thisSessionId = Math.random().toString(36).substr(2, 60);
            await sessionStorage.setItem(storageIndex.recommendation.sessionId, thisSessionId);
            if (!sessionHistory) return await set(storageIndex.recommendation.sessionHistory, {
                id: thisSessionId,
                watches: [],
                searches: []
            })
            if (sessionHistory.id !== thisSessionId) return await update(storageIndex.recommendation.sessionHistory, a => ({
                id: thisSessionId,
                watches: [...a.watches.slice(1).slice(-(window.__kn.music.config.last_session_carry_recom_length || 5))],
                searches: []
            }));

            //    sessionHistory
        }
    }

    async addWatch({song, playerState}) {
        await update(storageIndex.recommendation.sessionHistory, a => ({
            ...a,
            watches: [...a.watches, {
                song: song,
                player_type: playerState.Dialog ? 1 : 0.5,
                // watched_length: window.__kn.music.audio.currentTime,
            }]
        }));
        Log("Updated SessionHistory")
        await this._onUpdate();

        // const history = await get(storageIndex.recommendation.sessionHistory);
        // // const index = history.watches.length;
        // history.watches.push({
        //     song: song,
        //     player_type: playerState.Dialog ? 1 : 0.5,
        //     // watched_length: window.__kn.music.audio.currentTime,
        // });
        // // window.__kn.music.audio.addEventListener('timeupdate', async (event) => {
        // //     console.log("index, window.__kn.music.audio.currentTime")
        // //     await this._update_watch_time(index, window.__kn.music.audio.currentTime);
        // // });
        // await set(storageIndex.recommendation.sessionHistory, history);
    }

    async addSearch(query) {
        await update(storageIndex.recommendation.sessionHistory, a => ({
            ...a,
            searches: [...a.searches, {
                query: query,
            }]
        }));
        Log("Updated SessionHistory")
        await this._onUpdate();
    }

    async getRecommendations() {
        const history = await get(storageIndex.recommendation.sessionHistory);
        return await comLinkWorker.fetch(endPoints.Recommendations.deprecated.getRecommendations, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                Authorization: `Bearer ${await initAuth()}`
            },
            body: await comLinkWorker.JSON.stringify({
                watches: history.watches.map(a => a.song),
                searches: history.searches,
                id: history.id
            })
        });
    }

    async getWatches() {
        return await get(storageIndex.recommendation.sessionHistory);
    }

    async _update_watch_time(index, time) {
        const history = await get(storageIndex.recommendation.sessionHistory)
        if (history.watches[index]) {
            history.watches[index].watched_length = time;
        }
        await set(storageIndex.recommendation.sessionHistory, history);
    }
}

export const SessionRecommendation = new _SessionRecommendation();
export default SessionRecommendation
