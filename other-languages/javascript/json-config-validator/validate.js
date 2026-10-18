// Validate a JSON config file against a tiny rule set.
const fs = require("node:fs");

const RULES = {
  name: { type: "string", required: true },
  port: { type: "number", required: true, min: 1, max: 65535 },
  debug: { type: "boolean", required: false },
};

function validate(obj, rules = RULES) {
  const errors = [];
  for (const [key, rule] of Object.entries(rules)) {
    const v = obj[key];
    if (v === undefined) {
      if (rule.required) errors.push(`${key}: required`);
      continue;
    }
    if (typeof v !== rule.type) errors.push(`${key}: expected ${rule.type}`);
    else if (rule.type === "number" && (v < rule.min || v > rule.max))
      errors.push(`${key}: must be ${rule.min}..${rule.max}`);
  }
  return errors;
}

module.exports = { validate };

if (require.main === module) {
  const file = process.argv[2];
  if (!file) { console.error("Usage: node validate.js config.json"); process.exit(1); }
  const errors = validate(JSON.parse(fs.readFileSync(file, "utf8")));
  console.log(errors.length ? errors.join("\n") : "OK");
  process.exit(errors.length ? 1 : 0);
}
