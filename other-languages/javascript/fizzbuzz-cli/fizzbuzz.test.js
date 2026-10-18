const test = require("node:test");
const assert = require("node:assert");
const { fizzbuzz } = require("./fizzbuzz");

test("first 15", () =>
  assert.deepStrictEqual(fizzbuzz(15).slice(-5), ["11", "Fizz", "13", "14", "FizzBuzz"]));
