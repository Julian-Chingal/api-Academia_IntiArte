const router = require("express").Router()
const { controllCourse } = require("../controllers")

router.get("/", controllCourse.getcourse);

module.exports = router
