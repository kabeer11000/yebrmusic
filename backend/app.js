require("dotenv").config();
const createError = require("http-errors");
const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const cors = require("cors");
const rateLimit = require("express-rate-limit");
const session = require("express-session");
const MongoStore = require("connect-mongo")(session);

const limiter = rateLimit({
    windowMs: 1 * 60 * 1000, // 10 minutes 20 request
    max: 100 // limit each IP to 100 requests per windowMs TODO Default 10
});
const keys = require("./keys/keys");
const app = express();
// const http = require("http").createServer(app);
// const io = require("socket.io")(http);
// io.on("connection", function (socket) {
// 	console.log("A user is connected");
// });
// const http = require("http").Server(app);
// app.io = require("socket.io")(http);

const backendRouter = require("./routes/Backend");
const authRouter = require("./routes/Auth");
// const ProxyRouter = require("./routes/Proxy");
const songsRouter = require("./routes/SongsAPI");
const recomRouter = require("./routes/RecomAPI/simpleRecom");
// const castEventRouter = require("./routes/RecomAPI/SessionMaintain");
// const clientComSocket = require("./routes/RecomAPI/ClientComSocket")(app.io);

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "jade");

//app.use('/api/', limiter);
app.use(cors());
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.urlencoded({extended: true}));
app.use(express.json());
app.use(session({
    secret: "5s323720194bccb1cb94164a13E144994E3E17F9B",
    resave: true,
    cookie: {
        secure: false
    },
    saveUninitialized: true,
    store: new MongoStore({
        url: keys.db.url
    })
}));
app.set("json spaces", 2);
// app.use("/proxy", ProxyRouter);
app.use(express.static("public"/*/build*/));
app.get(["/home", "/downloads", "/liked", "/history", "/settings", "/search", "/search/results", "/artist", "/charts"], (req, res) => {
    res.sendFile(path.resolve(__dirname, "public", "build", "index.html"));
});
app.use("/api", songsRouter);
app.use("/auth", authRouter);
app.use("/backend", backendRouter);
app.use("/recom", recomRouter);
app.use("/feed", require("./routes/Feed"));
// app.use("/cast", castEventRouter);
app.use("/tests", require("./controllers/recom/exp/download-top-playlist"));
// app.use("/socket/com", clientComSocket);


/*
app.use((err, req, res, next) => {
  log.error(err);
  log.error(err.stack);
  return res.status(err.statusCode || 500).send(err.message)
});
//*/
// catch 404 and forward to error handler
app.use(function (req, res, next) {
    next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get("env") === "development" ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render("error");
});

module.exports = app;


//PLkqz3S84Tw-TGS_ltn3Yu_4JQAulJqXrL
