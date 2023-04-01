window["__kn.website.static.research.blog:renderer.assetURLS"] = [{
    type: "link",
    attach: "head",
    position: "bottom",
    optionalProps: {href: "/__/internal/blog.markdown.css"}
}, {
    type: "link",
    attach: "head",
    position: "bottom",
    optionalProps: {href: "https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"}
}, {
    type: "script",
    attach: "body",
    position: "bottom",
    optionalProps: {src: "https://cdn.jsdelivr.net/gh/kabeer11000/docs-hosted@research.kabeersnetwork.tk/_internal/postMessage.js"}
}, {
    type: "script",
    attach: "body",
    position: "bottom",
    optionalProps: {src: "https://cdn.jsdelivr.net/gh/kabeer11000/docs-hosted@research.kabeersnetwork.tk/_internal/postMessage.js"}
}, {
    type: "script",
    attach: "body",
    position: "bottom",
    optionalProps: {defer: true, src: "https://cdn.jsdelivr.net/npm/marked/marked.min.js"}
}];

!(async () => {
    const assets = window["__kn.website.static.research.blog:renderer.assetURLS"];
    if (! assets) return console.error("Asset Loader Failed, Asset URLs Not Set: ")
    const objectToProps = (object) => Object.entries(object).map((key, value) => `${key}="${value}"`).join(" ")
    const setAttributes = (el, attrs) => Object.keys(attrs).forEach(key => el.setAttribute(key, attrs[key]));

    for (const asset of assets) {
        const element = document.createElement(asset.type);
        setAttributes(element, asset.optionalProps || {});
        document[asset.attach === "head" ? "head" : "body"][asset.position === "top" ? "prepend" : "append"](element);
    }
})();
