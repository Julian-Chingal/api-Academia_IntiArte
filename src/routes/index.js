const router = require('express').Router()

router.use('/inventory', require('./inventory'))
router.use('/course' , require('./course'))

module.exports = router
