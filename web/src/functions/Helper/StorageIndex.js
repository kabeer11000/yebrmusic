export const storageIndex = {
    userData: "bGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9",
    artists: {
        IdResolver: (u) => `__kn.music.artist.yt.channel.id-${u}`,
        saveObject: (id) => `__kn.music.artists.save.${id}.details`,
    },
    discover: {
        saveObject: "__kn.music.discover.save.details",
        timeObject: "__kn.music.discover.save.time"
    },
    trendingArtists: {
        saveObject: "__kn.music.artists.save.details",
        timeObject: "__kn.music.artists.save.time"
    },
    recommendation: {
        sessionId: "__kn.music.recom.session.id",
        sessionHistory: "__kn.music.recom.session.history"
    },
    home: {
        saveObject: "__kn.music.home.save.details",
        timeObject: "__kn.music.home.save.time",
        etag: "__kn.music.home.save.etag"
    },
    homeSongObject: "6pcGyKPkNzCc1LIrvJperozvZemGtVK6FKn2uU4",
    homeTimeObject: "b1dvcmxkX0NuOU91VU5UWlJmdWFDbndjNjp1c2V",
    deviceEtag: "deviceEtag", // iJBU3Ryb1dvcmxkX0NuOU91VWlJmdWFozvZ
    deviceName: "deviceName", // MDcwYTlmZTIzOTQ1N2QiLCJpYXQiOjE268d
    castDevices: "castDevices", // `QiOjE2MDAwNTE4MDEsImV4cCI6MTYwMDA1O`
    castEnabled: "castEnabled",
    currentlyCasting: "currentlyCasting", // `0MTg0YjM4ZTJmMDBlNDNiMDcwYTl`
    castingTo: "castingTo", // `0MTg0YjM4ZTJmMDBlNDNiMDcwYTlm`
    castSnackbarKey: "TEMP____5UWlJmdWFDbndjNjp1c",
    darkMode: "darkMode",
    litemode: "__kn.music.options.litemode",
    castPreventRepeat: "castPreventFakeId",
    onScreenKeyboard: "onScreenKeyboard",
    castAcceptedDevices: "castAcceptedDevices",
    cookies: {
        deviceID: "__kn.auth.user.device-id",
        UserData: "__kn.music.auth.k-auth:userdata",
        AuthUser: "__kn.music.auth.k-auth:authUser",
        Tokens: "__kn.music.auth.k-auth:tokens",
        RefreshToken: "__kn.music.auth.k-auth:refresh_token",
        ServiceLoginToken: "__kn.music.auth.k-auth:api_token"
    },
    AuthUserParam: "u",
    GA: "G-MHLTWXY386"

};
