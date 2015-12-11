var fulfilled = function(value) { console.log(`Success: ${value}`); }
var rejected = function(err) { console.log(`Error: ${err}`); }
var successObj = { then: function(cb) { cb(42); }};
var failObj = { then: function(cb,err) { err("ouch"); }};
var p1 = Promise.resolve( successObj );
var p2 = Promise.resolve( failObj );
p1.then(fulfilled, rejected);
p2.then(fulfilled, rejected);
