const express = require("express");
const cors = require("cors");


const app = express();
const Router = require("./Routes");

app.set("json spaces", 2);
app.use(cors());

// Routes
app.use("/", Router);

app.listen(7000);
