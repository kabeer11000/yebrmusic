export const RetrievalDeleteLS = {
    set: async (key, val) => window.localStorage.setItem(key, val),
    get: async (key) => {
        const _ = window.localStorage.getItem(key);
        window.localStorage.removeItem(key)
        return _;
    }
}
// window.SelfDeletingLS = RetrievalDeleteLS;
