const router = require('express').Router()
const {controllAuth}=require('../controllers')

router.post('/login', controllAuth.loginCtrl)
router.post('/register', controllAuth.RegisterCtrl)

module.exports = router