var fulfilled = function(value) { console.log(`Success: ${value}`); }
var rejected = function(err) { console.log(`Error: ${err}`); }
var p = Promise.resolve( 42 );
p.then(fulfilled, rejected); // Prints: Success: 42

var p = Promise.reject( 42 );
p.then(fulfilled, rejected); // Prints: Error: 42
