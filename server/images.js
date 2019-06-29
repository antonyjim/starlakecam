// Import std libraries
var fs = require('fs')
var path = require('path')

// Extract the stuff we need
var stat = fs.stat
var join = path.join

exports.getTimeStamp = function() {
  return new Promise(function(resolveTimestamp, rejectTimestamp) {
    stat(join(__dirname, '../wwwRoot/images/new.jpg'), function(err, results) {
      if (err) {
        rejectTimestamp(err)
      } else {
        if (results.isFile()) {
          resolveTimestamp({
            lastModified: results.mtimeMs,
            success: true
          })
        } else {
          rejectTimestamp(new Error('Could not locate new.jpg'))
        }
      }
    })
  })
}