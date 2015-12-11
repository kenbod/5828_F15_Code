var fs = require('fs');

var name = process.argv[2] // get filename from command line

var p = new Promise(
  function(resolve, reject) {
    fs.stat(name, function(err, stats) {
      if (err) {
        reject(err);
        return;
      }
      resolve(stats.size);
    })
  }
);

var fulfilled = function(size) {
  console.log(`The size of ${name} is ${size} bytes.`);
}

var rejected = function(err) {
  console.log(`Unable to determine the size of ${name}.`);
  console.log(err.message);
}

p.then(fulfilled, rejected)
