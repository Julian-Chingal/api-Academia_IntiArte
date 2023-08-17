const router = require("express").Router();
const { controllInventory } = require("../controllers");

// get
router.get("/item", controllInventory.getInventory);
router.get("/item/:id", controllInventory.getIdIventory);

// post
router.post("/item", controllInventory.createInventory);

// put
router.put("/item/:id", controllInventory.updateInventory);

// delete
router.delete("/item/:id", controllInventory.deleteInventory);

module.exports = router;
