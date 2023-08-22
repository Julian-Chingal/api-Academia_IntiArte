const DBconnection = require("../database");

const getCourse = (req, res) => {
  const query = `SELECT COURSE.NAME_COURSE, COURSE.DESCRIPTION_CO , CONCAT(PERSON.NAME_PERSON, ' ' ,PERSON.LASTNAME) AS DOCENT, DOCENT.SPECIALITY  FROM DOCENT INNER JOIN COURSE ON COURSE.FK_IDDOCENT = DOCENT.IDDOCENT INNER JOIN PERSON ON PERSON.IDPERSON = DOCENT.FK_IDPERSON ORDER BY PERSON.IDPERSON ASC;`;

  DBconnection.query(query, (err, rows, fields) => {
    if (!err) {
      res.json({"Courses": rows});
    } else {
      res.status(500).json({ msg: "!Error" });
    }
  });
};

const getIdCourse = (req, res) => {
  const id = req.params.id;
  const query = `SELECT COURSE.NAME_COURSE, COURSE.DESCRIPTION_CO, CONCAT(PERSON.NAME_PERSON, ' ' ,PERSON.LASTNAME) AS DOCENT, DOCENT.SPECIALITY FROM DOCENT INNER JOIN COURSE ON COURSE.FK_IDDOCENT = DOCENT.IDDOCENT INNER JOIN PERSON ON PERSON.IDPERSON = DOCENT.FK_IDPERSON WHERE COURSE.IDCOURSE = ${id}`;

  DBconnection.query(query, (err, rows, fields) => {
    if (!err) {
      if (rows.length === 0) {
        res.status(404).json({ msg: "Not Foud 😕" });
      } else {
        res.json(rows);
      }
    } else {
      res.status(500).json({ msg: "!Error" });
    }
  });
};

const createCourse = (req, res) => {
  const { id_docent, name, description } = req.body;

  const query = `INSERT INTO COURSE (FK_IDDOCENT, NAME_COURSE, DESCRIPTION_CO  ) VALUES( ?,?,?);`;

  DBconnection.query(query,[id_docent, name, description],(err, rows, fields) => {
      if (!err) {
        res.status(200).json({ msg: "Course Created" });
      } else {
        res.status(500).json({ msg: "!Error" });
      }
    }
  );
};

const updateCourse = (req, res) => {
  const { id } = req.params;
  const body = req.body

  const query = "UPDATE COURSE  SET ? WHERE IDCOURSE =  ?;";

  DBconnection.query(query,[body,id],(err, rows, fields) => {
      if (!err) {
        if (rows.affectedRows === 0) {
          res.status(404).json({ msg: "Not Foud 😕" });
        } else {
          res.json("Update successfully");
        }
      } else {
        res.status(403).json("!Eror data undefined");
      }
    }
  );
};

const deleteCourse = (req, res) => {
  const { id } = req.params;

  const query = "DELETE FROM COURSE WHERE IDCOURSE = ?;";

  DBconnection.query(query, id, (err, rows, fields) => {
    if (!err) {
      if (rows.affectedRows === 0) {      
        res.status(404).json({ msg: "Not Foud 😕" });
      } else {
        res.status(200).json({ msg: "Course Removed" });
      }
    } else {
      res.status(500).json("!Error, Could not delete course");
    }
  });
};

module.exports = {
  getCourse,
  getIdCourse,
  createCourse,
  updateCourse,
  deleteCourse,
};
