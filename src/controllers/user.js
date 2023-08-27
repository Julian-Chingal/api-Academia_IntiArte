const prsima = require("../database");

// get
const getUser = async (req, res) => {
  const { id } = req.params;

  try {
    const getUsers = await prsima.pERSON.findMany({
      where: {
        idperson: parseInt(id),
      },
      include: {
        USER: {
          select: {
            username: true,
          },
        },
      },
    });
    res.json(getUsers[0]);
  } catch (error) {
    res.status(500).json("!Error");
    console.log(error);
  }
};

module.exports = {
  getUser,
};
