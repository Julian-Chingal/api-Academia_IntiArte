const router = require("express").Router();
const { controllCourse } = require("../controllers");


router.get("/", controllCourse.getCourse);

router.get("/:id", controllCourse.getIdCourse);

router.post("/", controllCourse.createCourse)

router.put("/:id", controllCourse.updateCourse);

router.delete("/:id", controllCourse.deleteCourse);

module.exports = router;
