const router = require('express').Router()
const {controllAuth}=require('../controllers')

router.post('/login', controllAuth.loginCtrl)
router.post('/signup', controllAuth.signupCtrl)

module.exports = router