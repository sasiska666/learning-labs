function fizzbuzz(n) {
  const out = [];
  for (let i = 1; i <= n; i++) {
    out.push(i % 15 === 0 ? "FizzBuzz" : i % 3 === 0 ? "Fizz" : i % 5 === 0 ? "Buzz" : String(i));
  }
  return out;
}
module.exports = { fizzbuzz };
if (require.main === module) {
  const n = Number(process.argv[2] ?? 15);
  if (!Number.isInteger(n) || n < 1) { console.error("Usage: node fizzbuzz.js N"); process.exit(1); }
  console.log(fizzbuzz(n).join("\n"));
}
