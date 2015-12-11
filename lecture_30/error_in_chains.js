var double = function(v) {
  console.log("Got " + v + " sending " + (v * 2));
  return v * 2;
}

var trouble = function(v) {
  console.log("Uh oh, trouble!");
  foo.bar();
}

var recover = function(e) {
  console.log("Error: " + e);
  console.log("But let's recover...");
  return 42;
}

var success = function( m ) {
  console.log("Success: " + m);
}

var failure = function( e ) {
  console.log("Failure: " + e);
}

var p = Promise.resolve( 21 );

p.then(double, failure)
 .then(trouble, failure)
 .then(success, recover)
 .then(success, failure)
