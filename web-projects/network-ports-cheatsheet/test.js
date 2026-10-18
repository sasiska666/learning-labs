const assert = require("node:assert");
const { PORTS, filter } = require("./js/ports.js");
assert.ok(PORTS.length >= 20);
assert.deepStrictEqual(filter("ssh").map((r) => r[0]), [22]);
assert.deepStrictEqual(filter("5432").map((r) => r[2]), ["PostgreSQL"]);
assert.strictEqual(filter("").length, PORTS.length);
console.log("ports tests OK");
