const a = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiYWNjZXNzX3Rva2VuIiwiYXBwX25hbWUiOiJLYWJlZXJzIE11c2ljIEFwcCIsImFwcF9pZCI6IkFTdHJvV29ybGRfQ245T3VVTlRaUmZ1YUNud2M2IiwiZ3JhbnRfdHlwZXMiO\n" +
    "iJBU3Ryb1dvcmxkX0NuOU91VU5UWlJmdWFDbndjNjp1c2VybmFtZXxBU3Ryb1dvcmxkX0NuOU91VU5UWlJmdWFDbndjNjplbWFpbHxBU3Ryb1dvcmxkX0NuOU91VU5UWlJmdWFDbndjNjp1c2VyX2lkIiwidXNlcl9pZCI6ImM0MDAwMzc2MTE\n" +
    "0MTg0YjM4ZTJmMDBlNDNiMDcwYTlmZTIzOTQ1N2QiLCJpYXQiOjE2MDAwNTE4MDEsImV4cCI6MTYwMDA1OTAwMX0.5qva6pcGyKPkNzCc1LIrvJperozvZemGtVK6FKn2uU4";
export const storageIndex = {
    userData: "bGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9",
    artists: {
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
    castPreventRepeat: "castPreventFakeId",
    onScreenKeyboard: "onScreenKeyboard",
    castAcceptedDevices: "castAcceptedDevices",
    cookies: {
        UserData: "__kn.music.auth.k-auth:userdata",
        Tokens: "__kn.music.auth.k-auth:tokens",
    }

};
