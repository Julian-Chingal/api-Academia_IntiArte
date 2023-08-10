const routercourse = require("express").Router();
const { controllCourse } = require("../controllers");

routercourse.get("/", controllCourse.getcourse);

module.exports = routercourse;
