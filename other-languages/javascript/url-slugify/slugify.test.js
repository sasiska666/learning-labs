const test = require("node:test");
const assert = require("node:assert");
const { slugify } = require("./slugify");

test("english", () => assert.strictEqual(slugify("Hello, World!"), "hello-world"));
test("russian", () => assert.strictEqual(slugify("Привет мир"), "privet-mir"));
test("trims dashes", () => assert.strictEqual(slugify("  --Hi--  "), "hi"));
