var fs = require('fs');

var is_file = function(name) {
  return fs.statSync(name).isFile();
};

var get_size = function(name) {
  return fs.statSync(name).size;
}

var entries = fs.readdirSync('.');
var files   = entries.filter(is_file);
var total   = 0

files.forEach(function(name) {
  total += get_size(name);
});

console.log("Total size:", total);
