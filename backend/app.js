const express = require("express");
const cookieParser = require("cookie-parser");
const cors = require("cors");
const DDOS = require("ddos");
const config = require("./config");

const coreScraper = require("./routes/core-scraper-routes");
const authRouter = require("./routes/auth-routes");
const apiRouter = require("./routes/api-routes");
const recommendationRouter = require("./routes/recommendation-routes");

// const ddos = new DDOS({burst: 10, limit: 20, onDenial: async () => console.log("DOS Denied")})
const app = express();
// app.use(ddos.express);
// app.use((req, res, next) => {
//     console.log('[Yebr]: request intercepted: ' + req.path);
//     res.setHeader("Access-Control-Allow-Origin", "*");
//     res.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
//     res.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");

//     // If it's a preflight check, reply immediately and STOP.
//     if (req.method === "OPTIONS") {
//         return res.sendStatus(200);
//     }

//     next();
// });
app.use(cors({
    credentials: true, optionsSuccessStatus: 200,
    origin: (origin, callback) => callback(null, origin),
    // @0x, testing and debugging origin 
    // origin: (origin, callback) => (origin === config.FRONTEND_URL || !origin) ? callback(null, true) : callback(new Error("Cors error occurred"))
}));
app.use(cookieParser());
app.use(express.json({}));
app.use(express.urlencoded({ extended: true }));
app.set("json spaces", process.env.NODE_ENV === "production" ? 0 : 2);
app.use("/api", apiRouter);
app.use("/auth", authRouter);
app.use("/recommendation", recommendationRouter);
/**
 * @deprecated
 * But used for getArtistInfo: EndPoints.js:L41
 */
app.use("/backend", coreScraper);


app.use((req, res) => res.json("404 - Route Not Found"));
app.use((err, req, res) => res.status(500).json(err.message));

module.exports = app;


//PLkqz3S84Tw-TGS_ltn3Yu_4JQAulJqXrL
