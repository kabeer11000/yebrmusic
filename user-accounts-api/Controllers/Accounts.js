/*** TODO Experimental ***/
const keys = require("../keys");
const MongoClient = require("mongodb").connect(keys.Database.url, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(db => db.db("music"));
const axios = require("axios");
const uuid = require("uuid");
const jwt = require("jsonwebtoken");
const Storage = {
    collections: {
        channels: "Channels"
    },
    internalCommunication: {
        headers: {
            "internal.verification_token": "__kn.auth.internal.verification_token"
        }
    },
}

const KabeersAuthAPI = `https://auth-platform-backend-ingress.kabeersnetwork.tk/api-server/internal/apps`
const CreateChannel = async (req, res) => {
    try {
        res.end();
        const db = await MongoClient;
        const {user_id} = ({
            user_id: "SD6YoQaxbvSMrXkHuXWQM9kjgcJuYN4aCQNbc8jA"
        });
        const {channelTitle} = {channelTitle: "MainChannel"} || req.body;
        const accountFound = await db.collection(Storage.collections.channels).find({"account.user_id": user_id}).toArray();
        if (!accountFound.length) await db.collection(Storage.collections.channels).insertOne({
            channelTitle: channelTitle,
            channelId: uuid.v4(),
            owner: {
                user_id: user_id
            },
            stats: {
                views: 0
            }
        });
        console.log("Done");
    } catch (e) {
        console.log(e);
        res.end();
    }
};

const GetChannel = async (req, res) => {
    try {
        const {channelId} = req.params;
        const db = await MongoClient;
        const channel = await db.collection(Storage.collections.channels).findOne({"channelId": channelId});
        if (!channel) return console.log(req.params)
        const token = await jwt.sign({
            service: "__k.app.api",
            scope: "userinfo.read",
        }, keys.internalCommunication.rsa.private, {
            algorithm: "RS256",
            expiresIn: "10m"
        });
        const user = await axios.get(`${KabeersAuthAPI}/userinfo/${channel.owner.user_id}`, {
            headers: {
                [Storage.internalCommunication.headers["internal.verification_token"]]: token
            }
        }).then(r => r.data);
        if (!user) return console.log("!User")
        const response = await ({
            etag: uuid.v4(),
            "id": channel.channelId,
            "url": `https://music.kabeersnetwork.tk/artist?id=${channel.channelId}`,
            "title": `Uploads from ${channel.channelTitle}`,
            "estimatedItemCount": 0,
            "views": 0,
            "thumbnails": [{
                "url": user.account_image,
                "width": 336,
                "height": 188
            }],
            "bestThumbnail": {
                "url": user.account_image,
                "width": 336,
                "height": 188
            },
            "lastUpdated": new Date(user.date).toString(),
            "description": null,
            "visibility": "everyone",
            "author": {
                "name": channel.channelTitle,
                "url": "https://www.youtube.com/channel/" + channel.channelId,
                "avatars": [{
                    "url": user.account_image,
                    "width": 176,
                    "height": 176
                }],
                "bestAvatar": {
                    "url": user.account_image,
                    "width": 176,
                    "height": 176
                },
                "channelID": channel.channelId,
                "avatar": user.account_image
            },
        });
        res.json(response)
    } catch (e) {
        console.log(Storage.internalCommunication.headers["internal.verification_token"]);
        console.log(e);
        res.end();
    }
}
module.exports = ({
    CreateChannel,
    GetChannel
})
