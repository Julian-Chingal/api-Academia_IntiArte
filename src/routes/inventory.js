const router = require("express").Router()
const { controllInventory } = require("../controllers")

// get
router.get("/items", controllInventory.getInventory)
router.get("/items/:id", controllInventory.getIdIventory)

// post
router.post("/register/item", controllInventory.postInventory)

// put
router.put("/update/item/add/:id", controllInventory.putAddInventory)
router.put("/update/item/del/:id", controllInventory.putDelInventory)

// patch 
router.patch("/update/item/add/:id", controllInventory.putAddInventory) //solo si se requiere actualizar algunos valores

// delete

module.exports = router
