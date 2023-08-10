const routerinventory = require("express").Router()
const { controllInventory } = require("../controllers")

// get
routerinventory.get("/items", controllInventory.getInventory)
routerinventory.get("/items/:id", controllInventory.getIdIventory)

// post
routerinventory.post("/register/item", controllInventory.postInventory)

// put
routerinventory.put("/update/item/add/:id", controllInventory.putAddInventory)
routerinventory.put("/update/item/del/:id", controllInventory.putDelInventory)

// patch 
routerinventory.patch("/update/item/add/:id", controllInventory.putAddInventory) //solo si se requiere actualizar algunos valores

// delete

module.exports = routerinventory;
