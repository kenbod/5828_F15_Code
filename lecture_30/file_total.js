var fs = require('fs');

var fail = function(err) { console.log(err); };

var report = function(size) {
  console.log("Total size:", size);
}

var get_files = function(dir) {
  return new Promise(function(resolve, reject) {
    fs.readdir(dir, function(err, files) {
      if (err) reject(err);
      resolve(files);
    });
  });
}

var get_size = function(name) {
  return new Promise(function(resolve, reject) {
    fs.stat(name, function(err, stats) {
      if (err) reject(err);
      resolve(stats.size);
    });
  });
}

var is_file = function(name) {
  return new Promise(function(resolve, reject) {
    fs.stat(name, function(err, stats) {
      if (err) reject(err);
      resolve([name, stats.isFile()]);
    });
  });
}

var detect = function(files) {
  var promises = []
  files.forEach( file => promises.push(is_file(file)));
  return Promise.all(promises);
}

var gather = function(files) {
  var promises = []
  files.forEach( function(info) {
    var name   = info[0];
    var isFile = info[1];
    if (isFile) {
      promises.push(get_size(name));
    }
  });
  return Promise.all(promises);
}

var sum = function(sizes) {
  return sizes.reduce((a,b) => a + b);
}

var print_it = function(items) {
  items.forEach( item => console.log(item))
}

var files = get_files('.');

files.then(detect).then(gather).then(sum).then(report).catch(fail);
// files.then(print_it);
// files.then(detect).then(print_it);
// files.then(detect).then(gather).then(print_it);
