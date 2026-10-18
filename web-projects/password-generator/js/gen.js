var SETS = {
  lower: "abcdefghijklmnopqrstuvwxyz",
  upper: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
  digits: "0123456789",
  symbols: "!@#$%^&*()-_=+[]{};:,.?"
};

// Unbiased random integer in [0, max) using rejection sampling over crypto randomness.
function randomInt(max, rng) {
  var limit = Math.floor(0x100000000 / max) * max;
  var buf = new Uint32Array(1);
  while (true) {
    rng(buf);
    if (buf[0] < limit) return buf[0] % max;
  }
}

function generate(length, enabled, rng) {
  var pools = Object.keys(SETS).filter(function (k) { return enabled[k]; });
  if (!pools.length) throw new Error("Select at least one character set");
  var all = pools.map(function (k) { return SETS[k]; }).join("");
  var chars = [];
  pools.forEach(function (k) { chars.push(SETS[k][randomInt(SETS[k].length, rng)]); }); // one of each
  while (chars.length < length) chars.push(all[randomInt(all.length, rng)]);
  for (var i = chars.length - 1; i > 0; i--) {   // Fisher-Yates shuffle
    var j = randomInt(i + 1, rng);
    var t = chars[i]; chars[i] = chars[j]; chars[j] = t;
  }
  return chars.slice(0, length).join("");
}

function entropyBits(length, poolSize) { return length * Math.log2(poolSize); }

if (typeof document !== "undefined") {
  var rng = function (buf) { crypto.getRandomValues(buf); };
  var $ = function (id) { return document.getElementById(id); };
  var enabled = function () {
    return { lower: $("lower").checked, upper: $("upper").checked, digits: $("digits").checked, symbols: $("symbols").checked };
  };
  var run = function () {
    try {
      var e = enabled(), len = Number($("len").value);
      $("out").textContent = generate(len, e, rng);
      var size = Object.keys(SETS).filter(function (k) { return e[k]; }).reduce(function (n, k) { return n + SETS[k].length; }, 0);
      $("bits").textContent = "About " + Math.round(entropyBits(len, size)) + " bits of entropy";
    } catch (err) { $("out").textContent = err.message; }
  };
  $("len").addEventListener("input", function () { $("lenv").textContent = $("len").value; run(); });
  $("gen").addEventListener("click", run);
  $("copy").addEventListener("click", function () {
    var t = $("out").textContent;
    if (navigator.clipboard) navigator.clipboard.writeText(t);
  });
  run();
}
if (typeof module !== "undefined") module.exports = { generate: generate, randomInt: randomInt, SETS: SETS };
