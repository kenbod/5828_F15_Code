var fireCount = 0;
var start = new Date;
var timer = setInterval(function() {
  if (new Date - start > 1000) {
    clearInterval(timer);
    console.log(fireCount);
    return;
  }
  fireCount++;
}, 0);
