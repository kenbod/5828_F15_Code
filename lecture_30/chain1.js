var fulfilled = function(value) { console.log(`Success: ${value}`); }
var rejected = function(err) { console.log(`Error: ${err}`); }

var double = function( v ) {
  return v * 2;
}

var step1 = Promise.resolve( 21 );

var step2 = step1.then( double, rejected )

step2.then( fulfilled, rejected );

Promise.resolve( 21 ).then( double, rejected ).then( fulfilled, rejected)
