var fs = require('fs');

var all_done = function(size) {
  console.log("Total size:", size);
}

var handleFile = function(stats, i, filenames, total) {
  if (i === filenames.length - 1) {
    all_done(total + stats.size);
  } else {
    processFile(i+1, filenames, total+stats.size);
  }
}

var handleDir = function(i, filenames, total) {
  if (i === filenames.length - 1) {
    all_done(total);
  } else {
    processFile(i+1, filenames, total);
  }
}

var processFile = function(i, filenames, total) {
  var name = filenames[i];
  fs.stat(name, function(err, stats) {
    if (err) throw err;
    if (stats.isFile()) {
      handleFile(stats, i, filenames, total);
    } else {
      handleDir(i, filenames, total);
    }
  });
}

fs.readdir('.', function(err, filenames) {
  if (err) throw err;
  console.log("Number of Directory Entries:", filenames.length)
  processFile(0, filenames, 0);
});
