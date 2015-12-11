var fulfilled = function(value) { console.log(`Success: ${value}`); }
var rejected = function(err) { console.log(`Error: ${err}`); }
var p1 = Promise.resolve( 42 );
var p2 = Promise.resolve( p1 );
console.log(`p1 and p2 are the same object: ${p1 === p2}`);
