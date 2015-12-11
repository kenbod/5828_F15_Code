var step1 = new Promise(
  function(resolve, reject) {
    setTimeout(function() {
      resolve();
    }, 5000);
  }
);

step1.then(function() { console.log("Step 1 is done!"); });
