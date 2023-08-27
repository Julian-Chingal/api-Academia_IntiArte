const prisma = require("../database");

const getCourse = async (req, res) => {
  try {
    const course = await prisma.cOURSE.findMany();

    res.json({ Courses: course });
  } catch (error) {
    res.status(500).json({ msg: "!Error" });
  }
};

// course id
const getIdCourse = async (req, res) => {
  const { id } = req.params;

  try {
    const course = await prisma.cOURSE.findFirst({
      where: {
        idcourse: parseInt(id),
      },
    });
    if (course) {
      res.json(course);
    } else {
      res.status(404).json({ msg: "Not Foud 😕" });
    }
  } catch (error) {
    res.status(500).json({ msg: "!Error" });
  }
};

const createCourse = async (req, res) => {
  const { id_docent, name, description } = req.body;
  try {
    const newCourse = await prisma.cOURSE.create({
      data: {
        fk_iddocent:id_docent,
        name_course: name,
        description_co: description
      }
    });
    res.json({"newCourse": newCourse})
  } catch (error) {
    res.status(500).json({ msg: "!Error" });
  }
};

const updateCourse = async (req, res) => {
  const { id } = req.params;
  const {name, description} = req.body;

  try {
    const updateCourse = await prisma.cOURSE.update({
      where: {
        idcourse: parseInt(id)
      },
      data: {name_course: name ,
      description_co: description}
    })
    res.json({"Course updated successfully 🎆 🎇" : updateCourse  });
   
  } catch (error) {
    console.log(error)
    res.status(500).json({ msg: "!Error" });
  }
};

const deleteCourse = async (req, res) => {
  const { id } = req.params;
  try {
    const deleteCourse = await prisma.cOURSE.delete({where:{
      idcourse: parseInt(id)
    }})
    res.json({"Course removed": deleteCourse})
  } catch (error) {
    res.status(500).json("!Error, Could not delete course");
  }
};

module.exports = {
  getCourse,
  getIdCourse,
  createCourse,
  updateCourse,
  deleteCourse,
};
