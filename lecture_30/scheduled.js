var testNow = function() {
  console.log(`testNow  :    1: ${Date.now()}`)
  var p = new Promise(
    function(resolve, reject) {
      console.log(`testNow  :    ?: ${Date.now()}`)
      resolve(Date.now());
    }
  );
  console.log(`testNow  :    2: ${Date.now()}`)
  return p;
};

var testLater = function() {
  console.log(`testLater:    1: ${Date.now()}`)
  var p = new Promise(
    function(resolve, reject) {
      setTimeout(function() {
        console.log(`testLater:    ?: ${Date.now()}`)
        resolve(Date.now());
      }, 0);
    }
  );
  console.log(`testLater:    2: ${Date.now()}`)
  return p;
};

var p = testNow();

p.then(function (value) {
  console.log(`testNow  : then: ${value}`);
});

p = testLater();

p.then(function (value) {
  console.log(`testLater: then: ${value}`);
});
