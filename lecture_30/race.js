var p1 = new Promise( function(resolve, reject) {
  setTimeout(function() { resolve("I win!") }, 1000);
});

var p2 = new Promise( function(resolve, reject) {
  setTimeout(function() { resolve("I lose!") }, 2000);
});

var p3 = new Promise( function(resolve, reject) {
  setTimeout(function() { reject("Spoiler!") }, 500);
});

var p4 = new Promise( function(resolve, reject) {
  setTimeout(function() { reject("Not fast enough!") }, 3000);
});

Promise.race([p1, p2]).then(function(msg) { console.log(msg); });
Promise.race([p3, p4]).catch(function(msg) { console.log(msg); });
