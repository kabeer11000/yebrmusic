export default (...args) => console.log(`KabeersMusic@${window.__kn.music.version || "unknown"}:  `, ...args);

export const DebugLog = (...args) => {
    if (window.__kn.music["__kn.music.developers.debugging-enabled"]) console.log(`Debugger@${window.__kn.music["debugger_version"] || "unknown"}:  `, ...args);
};
