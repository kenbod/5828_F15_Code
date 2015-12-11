var fs = require('fs');

var fail = function(err) { console.log(err); };

var report = function(info) {
  var name = info[0];
  var size = info[1];
  console.log(`${name}: ${size} bytes.`);
}

var get_files = function(dir) {
  return new Promise(function(resolve, reject) {
    fs.readdir(dir, function(err, files) {
      if (err) { return reject(err)};
      resolve(files);
    });
  });
}

var get_contents = function(name) {
  return new Promise(function(resolve, reject) {
    fs.readFile(name, 'utf8', function(err, content) {
      if (err) { return reject(err) };
      resolve([name, content.length]);
    });
  });
}

var is_file = function(name) {
  return new Promise(function(resolve, reject) {
    fs.stat(name, function(err, stats) {
      if (err) { return reject(err) };
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
      promises.push(get_contents(name));
    }
  });
  return Promise.race(promises);
}

get_files('.').then(detect).then(gather).then(report).catch(fail);
