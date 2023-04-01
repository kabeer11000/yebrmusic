export const getArticle = (domParser, shadowInstance, domToImage, item) => new Promise(async resolve => {
    const markdown = await (await fetch("https://cdn.jsdelivr.net/gh/kabeer11000/docs-hosted@redirector-content/" + item.path)).text();
    const html = await shadowInstance.makeHtml(markdown);
    const doc = domParser.parseFromString(html, "text/html");

    const text = [];
    doc.querySelectorAll("p,pre").forEach((el) => text.push(el.textContent));
    resolve({
        heading: doc.querySelector("h1,h2,h3")?.textContent || "",
        excerpt: text.join().substring(0, 100),
        image: doc.querySelectorAll("img")[0]?.src //await domToImage.toPng(doc.body)
    });
});