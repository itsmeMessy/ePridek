const auth = require('./auth')

const router = require('express').Router()


router.use(auth)

module.exports = router