var lower = function(v) { return v.toLowerCase(); };
var rejected = function(err) { console.log(err); };
Promise.resolve(42).then(lower).catch(rejected);
