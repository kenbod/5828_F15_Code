var fs = require('fs');

fs.readdir('.', function(err, filenames) {
  if (err) throw err;
  console.log("Number of Directory Entries:", filenames.length)
  filenames.forEach(function (name) {
    fs.stat(name, function(err, stats) {
      if (err) throw err;
      var result = stats.isFile() ? "file" : "directory";
      console.log(name, "is a", result);
    });
  });
});
