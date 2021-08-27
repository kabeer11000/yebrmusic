import endPoints from "../api/EndPoints/EndPoints";
import {initAuth} from "./Auth";
import {DebugLog} from "./Log";


export const FetchBlob = async (uri) => {
    DebugLog("Fetching: ", uri);
    try {
        const token = await initAuth();
        return fetch(uri, {
            headers: {
                "Authorization": `Bearer ${token}`
            }
        }).then(r => r.blob());
    } catch (e) {
        console.log(e);
        return new Error("Fetch Error");
    }
};

export function _fetchProxiedBlob(url) {
    const URL = url;
    return new Promise(function (resolve, reject) {
        return initAuth().then((token) => {
            const xhr = new XMLHttpRequest();
            xhr.open("GET", endPoints.proxyURI(URL));
            xhr.responseType = "blob";
            xhr.setRequestHeader("Authorization", `Bearer ${token}`);
            xhr.onload = () => {
                const status = xhr.status;
                if (status >= 200 && status < 300) resolve(xhr.response);
                else reject({
                    status: status,
                    statusText: xhr.statusText
                });
            };
            xhr.send();
            setTimeout(() => {
                xhr.abort();
                xhr.open("GET", endPoints.proxyURI(URL));

                xhr.send();
            }, 1000);
        });
    });
}
