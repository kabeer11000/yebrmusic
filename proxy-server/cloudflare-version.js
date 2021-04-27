/*
Yebr Music - Proxy - Server
(c) 2021 Yebr Music Authors - All rights reserved (kabeersnetwork.tk)

kabeersnetwork@gmail.com
https://developers.kabeersnetwork.tk/#/docs/music
*/

/*
whitelist = [ "^http.?://www.zibri.org$", "zibri.org$", "test\\..*" ];  // regexp for whitelisted urls
*/
const blacklist = [];           // regexp for blacklisted urls
const whitelist = [".*", " "];     // regexp for whitelisted origins

const isListed = (uri) => typeof uri === "string" ? whitelist.some(item => !!uri.match(item)) : true;
const ForbiddenResponse = ({
    body: "403 - That's an error - Kabeer's Music",
    init: ({
        status: 403,
        statusText: 'Forbidden',
        headers: {
            "Content-Type": "text/html"
        }
    })
})

const log = (...args) => console.log("Log Event:", ...args);
const RequestHandler = async (event) => {

    const preflight = (event.request.method === "OPTIONS");
    /**
     * Dis-allow user-agents
     */
    if (!event.request.url) return new Response(ForbiddenResponse.body, ForbiddenResponse.init);

    const requestURI = new URL(event.request.url);
    const requestedUri = decodeURIComponent(requestURI.search.substr(1));
    const origin = event.request.headers.get("Origin");

    log(origin, requestedUri, requestURI, event.request)

    /**
     * Block specific origins
     */
    if ((!isListed(origin, blacklist)) && (isListed(origin, whitelist))) return new Response(ForbiddenResponse.body, ForbiddenResponse.init);
    /**
     * Check if preflight request
     */
    if (preflight) {
        return new Response(null, {
            headers: new Headers({
                "Access-Control-Allow-Origin": origin
            }),
            status: (200),
            statusText: ("OK - Everything's fine joe")
        })
    }
    /**
     * Respond with resource with Appropriate CORS headers
     */
    if (requestedUri && requestedUri.length) {
        try {
            const response = await fetch(requestedUri, {
                method: event.request.method,
                body: event.request.body,
                origin: origin,
            });
            const headers = new Headers(response.headers);
            headers.set("Access-Control-Allow-Origin", origin);
            headers.delete("X-Content-Type-Options");

            return new Response(await response.arrayBuffer(), {
                headers: headers,
                status: response.status,
                statusText: response.statusText
            });
        } catch (e) {
            return new Response(ForbiddenResponse.body, ForbiddenResponse.init);
        }
    }
}
addEventListener("fetch", async event => {
    event.respondWith(RequestHandler(event));
});
