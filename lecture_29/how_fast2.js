var fireCount = 0;
var start = new Date;
var tick = function() {
  if (new Date - start > 1000) {
    console.log(fireCount);
    return;
  }
  fireCount++;
  process.nextTick(tick)
}
process.nextTick(tick)
