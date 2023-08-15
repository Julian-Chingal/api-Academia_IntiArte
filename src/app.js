const express = require("express");
const app = express()
const morgan = require("morgan");
const cors = require("cors");
const {PORT} = require('./config/index')
// const { loginMiddleware } = require("./utils/middleware");

//settings
app.set("port", PORT)

//middleware
app.use(morgan("dev"));
app.use(express.json());
app.use(cors());
// app.use(loginMiddleware)

//routes
app.use("/api", require("./routes"));

//start server
app.listen(app.get("port"), () => {
  console.log("👾 server running on port", app.get("port"), '👾');
});
