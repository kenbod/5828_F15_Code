try {
  setTimeout(function() {
    throw Error("Whoops!");
  }, 0);
} catch (err) {
  console.log(`${err}`);
}
console.log("Where is my error?");
