const router = require('express').Router()
const {controllUser} = require('../controllers/index')

router.get('/:id' , controllUser.getUser)
router.get('/employee' ,)
router.get('/docent' ,)
router.get('/student' ,)

module.exports = router