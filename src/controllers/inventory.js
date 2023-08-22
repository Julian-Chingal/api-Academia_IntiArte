const prisma = require("../database");

// cosult items
const getInventory = async (req, res) => {
  try {
    const items = await prisma.iNVENTORY.findMany();

    res.json({ Inventory: items });
  } catch (error) {
    res.status(500).json({ msg: "Error!" });
  }
};

// consult item id
const getIdIventory = async (req, res) => {
  const { id } = req.params;
  try {
    const item = await prisma.iNVENTORY.findFirst({
      where: {
        idinventory: parseInt(id),
      },
    });

    if (item) {
      res.json(item);
    } else {
      res.status(404).json({ msg: "Not Foud 😕" });
    }
  } catch (error) {
    res.status(500).json({ msg: "Error!" });
  }
};

// modify items add
const updateInventory = async (req, res, next) => {
  const { id } = req.params;
  const { cant, name } = req.body;

  try {
    const existingInventory = await prisma.iNVENTORY.findFirst({
      where: { idinventory: parseInt(id) },
    });

    // if not exist error
    if (!existingInventory) {
      res.status(404).json({ msg: "Not Foud 😕" });
    }

    let cantUpdate = existingInventory.cant;

    // if not null
    if (cant !== null) {
      if (typeof cant === "number") {
        cantUpdate += cant;
        if (cantUpdate <= 0) {
          res.status(505).json({ msg: "invalid quantity 😕" });
        }
      }
      const updateData = {
        cant: cantUpdate,
        item: name,
      };
      // update info
      const update = await prisma.iNVENTORY.update({
        where: {
          idinventory: parseInt(id),
        },
        data: updateData,
      });
      res.json({ msg: "item updated successfully 🎆 🎇", update });
    }
  } catch (error) {
    res.status(500).json("!Error");
  }
};

// create new item
const createInventory = async (req, res) => {
  const { item, cant } = req.body;

  try {
    const newItem = await prisma.iNVENTORY.create({
      data: { item, cant, fk_idcompany: 1 },
    });
    res.json({ msg: "Item add successfully", newItem });
  } catch (error) {
    res.status(500).json({ msg: "!Error" });
    console.log(error);
  }
};

const deleteInventory = async (req, res) => {
  const { id } = req.params;
  try {
    const deleteItem = await prisma.iNVENTORY.delete({
      where: { idinventory: parseInt(id) },
    });

    res.json({ msg: "item successfully removed ☠️ 💯 ", deleteItem });
  } catch (error) {
    res.status(404).json({ msg: "Not Foud 😕" });
  }
};

module.exports = {
  getInventory,
  getIdIventory,
  updateInventory,
  createInventory,
  deleteInventory,
};
