const jwt = require("jsonwebtoken");
const {hash,compare} = require('bcryptjs')
const Dbconnection = require("../databaseMysql");

const RegisterCtrl = async (req, res, next) => {
  const { id, user, password, info } = req.body;

    console.log(info.name)
  // encrypt password
  const pass = await hash(password,10)

  // check user exist
  const newUser = Dbconnection.query(
    `SELECT PERSON.IDPERSON, USER.USERNAME, USER.PASSWORD_USER FROM PERSON INNER JOIN USER ON PERSON.IDPERSON = USER.FK_IDPERSON WHERE PERSON.IDPERSON = ${id};`, (err, rows, field) => {
      if (!err) {
        if (rows.length !== 0) {
          res.json("ALREADY_USER");
          next();
        }
      }
    }
  );
  
  
  if (newUser) {
    res.json({ "New User": {pass}});
  }
  
};

const loginCtrl = (req, res) => {};

module.exports = {
  RegisterCtrl,
  loginCtrl,
};
