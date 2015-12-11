var fulfilled = function(value) { console.log(`Success: ${value}`); }
var rejected  = function(err) { console.log(`Error: ${err}`); }

var trouble = function( v ) {
  foo.bar();
  console.log( "The meaning of life: " + v );
}

Promise.resolve(42).then(trouble, rejected)

console.log("Where did the error go?")

Promise.resolve(42).then(trouble, rejected).then(fulfilled, rejected);

console.log("Oh, there it is!")
