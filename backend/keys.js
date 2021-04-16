module.exports = {
    db: {
        url: process.env.MONGO_URI_DEV
    },
    app: {
        app_public: process.env.APP_PUBLIC,
        app_secret: process.env.APP_SECRET,
    },
    auth: {
        public: process.env.AUTH_PUBLIC,
        secret: process.env.AUTH_SECRET
    },
    internalCommunication: {
        rsa: {
            // private: process.env.INTERNAL_AUTH_PRIVATE.toString().replace("\\n", "\n"),
            public: `-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDLijg/VW0FVBY5adSW4Jv1oCf6
breemnVoXc9Q7if7OBt16zxpMUS0IW5HewrjvhqNgkk2xOARlIYfu6MZTuwsknV0
kQgLu/ma6FcB82atAQIkRHKB5DnQh3oOq34Dlub9caSi3OSKi/2cQyZ08Q9N4pX9
jZV0RNMvmkoUSw7IzQIDAQAB
-----END PUBLIC KEY-----`
        }
    },

    KabeerAuthPlatform_Public_RSA_Key: `-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCqC8QOAygPkks0h7iRVg7FNNVf
AlQhYjnK9vB69dw9TOG+DyjSuFUnpedEv0YfbGIC3dGqc5YHfqZPDy4U5Jj+H5/g
FzSdiI7AIauD5OLDCqBy6nyMC23GesMPibgaiEylvryreGmkfANEJSCtceVTjIHn
/MEgvdBd6oZAEkv0XQIDAQAB
-----END PUBLIC KEY-----`,
};

