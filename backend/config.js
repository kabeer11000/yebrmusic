module.exports = {
    SELF_URL: process.env.NODE_ENV === "production" ? process.env.HOSTNAME_PROD : process.env.HOSTNAME_DEV,
    K_AUTH_URL: process.env.K_AUTH_URL,
    FRONTEND_URL: process.env.FRONTEND_URI,
    K_AUTH_FRONTEND: process.env.K_AUTH_FRONTEND,
    FRONTEND_COOKIE_DOMAIN: "music.kabeersnetwork.tk",
    K_AUTH_SCOPE: "openid|s564d68a34dCn9OuUNTZRfuaCnwc6:getSong|s564d68a34dCn9OuUNTZRfuaCnwc6:search|s564d68a34dCn9OuUNTZRfuaCnwc6:feed|s564d68a34dCn9OuUNTZRfuaCnwc6:history.readwrite"
}
