# Password generator

Browser tool that builds random passwords with `crypto.getRandomValues`, rejection sampling (no modulo bias) and a Fisher-Yates shuffle. Guarantees at least one character from every selected set. Works offline; nothing is stored or sent.

> Written by Claude (Anthropic AI) from prompts by Mansur Karashashev. AI-generated code: open it in a browser and check it before publishing.

## Open and test
```bash
python -m http.server 8000     # then open http://localhost:8000
node test.js
```
