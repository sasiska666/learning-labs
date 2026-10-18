const test = require("node:test");
const assert = require("node:assert");
const { validate } = require("./validate");

test("valid", () => assert.deepStrictEqual(validate({ name: "a", port: 80 }), []));
test("missing name and bad port", () =>
  assert.deepStrictEqual(validate({ port: 99999 }), ["name: required", "port: must be 1..65535"]));
test("wrong type", () => assert.deepStrictEqual(validate({ name: 1, port: 80 }), ["name: expected string"]));
