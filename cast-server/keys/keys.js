module.exports = {
    db: {
        url: process.env.MONGO_URI_DEV
    },
    auth: {
        public: process.env.AUTH_PUBLIC,
        secret: process.env.AUTH_SECRET
    },
    KabeerAuthPlatform_Public_RSA_Key: `-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCqC8QOAygPkks0h7iRVg7FNNVf
AlQhYjnK9vB69dw9TOG+DyjSuFUnpedEv0YfbGIC3dGqc5YHfqZPDy4U5Jj+H5/g
FzSdiI7AIauD5OLDCqBy6nyMC23GesMPibgaiEylvryreGmkfANEJSCtceVTjIHn
/MEgvdBd6oZAEkv0XQIDAQAB
-----END PUBLIC KEY-----`
};

