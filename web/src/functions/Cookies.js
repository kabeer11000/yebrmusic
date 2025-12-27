export const Cookies = {
    /**
     * Get a cookie by key / name, returns empty string when cookie does not exist.
     *
     * @param {string} key - Cookie Key.
     * @returns {string} - Cookie Value
     */
    getCookie(key) {
        for (let t = key + "=", o = decodeURIComponent(document.cookie).split(";"), n = 0; n < o.length; n++) {
            for (var r = o[n]; " " === r.charAt(0);) r = r.substring(1);
            if (0 === r.indexOf(t)) return r.substring(t.length, r.length);
        }
        return "";
    },
    /**
     * Sets a cookie, client side, useful when setting preferences and deviceId's
     *
     * @param {string} key - Cookie Key.
     * @param {string} value - Cookie Value.
     * @param {number} expiry - Cookie Expiry in days.
     */
    setCookie(key, value, expiry) {
        const n = new Date();
        n.setTime(n.getTime() + 24 * expiry * 60 * 60 * 1e3);
        document.cookie = key + "=" + value + ";" + "expires=" + n.toUTCString() + ";path=/";
    },
    /**
     * Deletes a cookie by key / name
     *
     * @param {string} key - Cookie Key.
     * @returns {string} - document.cookie complete, after deletion
     */
    deleteCookie: (key) => document.cookie = key + "=; Max-Age=-99999999;"
};
