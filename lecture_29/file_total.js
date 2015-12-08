var fs = require('fs');
var total = 0

fs.readdir('.', function(err, filenames) {
  if (err) throw err;
  console.log("Number of Directory Entries:", filenames.length)
  filenames.forEach(function (name) {
    fs.stat(name, function(err, stats) {
      if (err) throw err;
      total += stats.size;
    });
  });
});

console.log("Total size:", total);
