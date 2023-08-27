const DBconnection = require("../database");

// cosult items
const getInventory = async (req, res) => {

  
  const query = `SELECT INVENTORY.IDINVENTORY AS ID, INVENTORY.ITEM, INVENTORY.CANT FROM INVENTORY  ORDER BY INVENTORY.IDINVENTORY ASC;`;

   DBconnection.query(query, (err, rows) => {
    if (!err) {
      res.json({"Inventory" : rows});
    } else {
      res.status(500).json({ msg: "Error!" });
    }
  });
};

// consult item id
const getIdIventory = (req, res) => {
  const { id } = req.params;

  const query = `SELECT INVENTORY.IDINVENTORY AS ID,INVENTORY.ITEM, INVENTORY.CANT FROM INVENTORY WHERE INVENTORY.IDINVENTORY = ${id};`;

  DBconnection.query(query, (err, rows) => {
    if (!err) {
      if (rows.length === 0) {
        res.status(404).json({ msg: "Not Foud 😕" });
      } else {
        res.json(rows);
      }
    } else {
      res.status(500).json({ msg: "Error!" });
    }
  });
};

// modify items add
const updateInventory = (req, res, next) => {
  const { id } = req.params;
  const { name, cant } = req.body;

  
  // consult existing quantity
  const queryinventory = `SELECT CANT, ITEM FROM INVENTORY WHERE IDINVENTORY = ?;`;

  DBconnection.query(queryinventory, id, (err, rows, fields) => {
    if (!err) {
      if (rows.length === 0) {
        return res.status(404).json({ msg: "Not Foud 😕" });
      } else {
        // add new cant
        const newcant = rows[0].CANT + cant;

        const query = `UPDATE INVENTORY SET CANT = ?, ITEM = ? WHERE IDINVENTORY = ?;`;

        DBconnection.query(query, [newcant,name,id], (err, rows) => {
          if (!err) {
            res.json({ msg: "item updated successfully 🎆 🎇" });
          } else {
            res.status(500).json({ msg: "!Error" });
          }
        });
      }
    } else {
      res.status(500).json("!Error");
    }
  });
};

// create new item
const createInventory = (req, res) => {
  const { item, cant } = req.body;
  const query =
    "INSERT INTO INVENTORY (ITEM, CANT, FK_IDCOMPANY) VALUES(?,?,1);";

  DBconnection.query(query, [item, cant], (err, rows, fields) => {
    if (!err) {
      res.json({ msg: "Item add successfully" });
    } else {
      res.status(500).json({ msg: "!Error" });
    }
  });
};

const deleteInventory = (req,res)=>{
  const {id} = req.params

  const query = "DELETE FROM INVENTORY WHERE IDINVENTORY = ?"

  DBconnection.query(query, id, (err,rows,fields)=>{
    if (!err) {
      if (rows.length !== 0) {
        res.json({msg: "item successfully removed ☠️ 💯 "})
      }
    }
  })
}

module.exports = {
  getInventory,
  getIdIventory,
  updateInventory,
  createInventory,
  deleteInventory
};
