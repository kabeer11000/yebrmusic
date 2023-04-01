export const base = (path) => `https://api.github.com/repos/kabeer11000/docs-hosted/contents/law.research.kabeersnetwork.tk/blog${path ? "" + path : ""}?ref=redirector-content`
export const getDirectoryContent = async (path) => {
    const response = await fetch(base(path))
    return response.json();
}
export const getFilesFromDirectory = async (path) => {
    let files = new Set();
    const folder = await getDirectoryContent(path);
    for (const item of folder) {
        if (item.type === "dir") files = new Set([...files, ...await getFilesFromDirectory(`${path ?? ""}/${item.name}`)]);
        if (item.name === "markdown.md") files.add(item);
    }
    return files;
}