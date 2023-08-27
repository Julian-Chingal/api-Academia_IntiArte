const jwt = require("jsonwebtoken");
const { hash, compare } = require("bcryptjs");
const prisma = require("../database");

const signupCtrl = async (req, res, next) => {
  const { id, user, password, info, position } = req.body;

  try {
    const checkIs = await prisma.pERSON.findFirst({
      where: { idperson: parseInt(id) },
    });

    // check user exist
    if (!checkIs) {
      // encrypt password
      const passHash = await hash(password, 10);

      const createPerson = await prisma.pERSON.create({
        data: {
          idperson: parseInt(id),
          name_person: info.name,
          lastname: info.lastname,
          age: info.age,
          email: info.email,
          tel: info.tel,
          fk_idtypedocument: parseInt(info.typeDocument),
        },
      });

      const createUser = await prisma.uSER.create({
        data: {
          fk_idperson: parseInt(id),
          username: user,
          password_user: passHash,
        },
      });
      if(createPerson && createUser){
        res.json("creado");
      }else{
        res.status(500).json("!Error")
      }
    } else {
      res.json("ALREADY_USER");
    }
  } catch (error) {
    res.status(500).json("!Error");
  }
};

const loginCtrl = async (req, res, next) => {
  const { user, password } = req.body;
  try {
    // check user
    const checkIs = await prisma.uSER.findFirst({
      where: {
        username: user,
      },
    });

    if (checkIs) {
      //Check password
      const matchPassword = await compare(password, checkIs.password_user);
      if (matchPassword === true) {
        res.json("password");
        console.log(matchPassword);
      } else {
        res.json("No password");
      }
    } else {
      res.json({ msg: "username not found 😥" });
    }
  } catch (error) {
    res.status(500).json("!Error");
  }
};

module.exports = {
  signupCtrl,
  loginCtrl
};
