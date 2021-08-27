export const Cookies = {
    getCookie(e) {
        for (let t = e + "=", o = decodeURIComponent(document.cookie).split(";"), n = 0; n < o.length; n++) {
            for (var r = o[n]; " " === r.charAt(0);) r = r.substring(1);
            if (0 === r.indexOf(t)) return r.substring(t.length, r.length);
        }
        return "";
    },
    setCookie(e, t, o) {
        const n = new Date();
        n.setTime(n.getTime() + 24 * o * 60 * 60 * 1e3);
        const r = "expires=" + n.toUTCString();
        document.cookie = e + "=" + t + ";" + r + ";path=/";
    },
    deleteCookie: (name) => document.cookie = name + "=; Max-Age=-99999999;"
};
