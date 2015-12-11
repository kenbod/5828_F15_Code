Promise.reject("whoops").then(null, function(err) { console.log(err); });
Promise.reject("whoops").catch(function(err) { console.log(err); });
