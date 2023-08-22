const jwt = require("jsonwebtoken");
const {hash,compare} = require('bcryptjs')
const Dbconnection = require("../database");

const RegisterCtrl = async (req, res, next) => {
  const { id, user, password, info } = req.body;

  // encrypt password
  const passHash = await hash(password,10)

  // check user exist
  const checkIs = Dbconnection.query(`SELECT IDPERSON FROM PERSON WHERE IDPERSON = ${id};`, (err, rows, field) => {
      if (!err) {
        if (rows.length !== 0) {
          res.json("ALREADY_USER");
        }
      }
    }
  );
  
  if (checkIs) {
    res.json({ "New User": {passHash}});
  }
};

const loginCtrl = async (req, res, next) => {
  const {user, password} = req.body
 
  // user existence
  Dbconnection.query("SELECT USERNAME, PASSWORD_USER FROM _USER WHERE USERNAME = ?;", user, (err,rows,field)=>{
    if (!err) {
      if (rows.length === 0) {
        res.json({msg: "username not found 😥"})
      }else{
        passCorect(rows[0])
      }
    }else{
      res.status(500).json(err)
      console.log("hay error")
    }
  })

  // extract password
  function passCorect (checkIs){
    passHash = checkIs.PASSWORD_USER

    return compare(password,passHash)
    res.json(checkIs)  
  }

  console.log(passCorect)
};

module.exports = {
  RegisterCtrl,
  loginCtrl,
};
