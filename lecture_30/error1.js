try {
  throw Error("Whoops!");
} catch (err) {
  console.log(`${err}`);
}
