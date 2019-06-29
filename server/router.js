// This module will be required by
var express = require('express')
var router = express.Router()
var getTimestamp = require('./images').getTimeStamp

router.use(function(req, res, next) {
  res.set('Access-Control-Allow-Origin', 'https://starlakecam.net')
  res.set('Access-Control-Request-Method', 'POST')
  next()
})

router.get('/info', function(req, res) {
  getTimestamp()
  .then(function(fileInfo) {
    res.status(200).json(fileInfo)
  })
  .catch(function(err) {
    res.status(500).json({
      error: err.message,
      success: false
    })
  })
})

module.exports = router