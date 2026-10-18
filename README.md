# learning-labs

Mansur's lab works, practice assignments and small web projects, organized by topic. Everything here is a learning project; each folder says what it contains and how to run it.

```text
learning-labs/
├── python/
│   ├── 01-basics/            # small exercises
│   ├── 02-practical-works/   # university practical works (CS-104с)
│   └── 03-mini-projects/     # own scripts and small tools
├── databases/
│   └── postgresql/           # SQL labs
├── other-languages/          # c/, javascript/, bash/
├── web-projects/             # one folder per site
└── docs/                     # notes, conventions
```

## Conventions

- One lab or project = one folder with its own `README.md` (what it does, how to run, what was learned).
- Folder names: lowercase, digits and hyphens, e.g. `lab-03-file-io`, `portfolio-site`.
- Numbered prefix for labs in course order.
- No secrets, `.env` files or personal data in commits.

## How this repository is made

All code in the works below was **written by Claude (Anthropic AI) from prompts by Mansur Karashashev**, who directs the work as a prompt engineer. Every work folder says so in its own README. Python, C, JavaScript and Bash works were run with their tests in the session that wrote them. The PostgreSQL labs were **not** executed against a PostgreSQL server yet. Practical works for university courses are meant to be the author's own and are not generated here.

## Index

| Folder | Works |
|--------|-------|
| [python/01-basics](python/01-basics/) | number-guess, word-counter, temperature-converter |
| [python/02-practical-works](python/02-practical-works/) | reserved for the author's own university work |
| [python/03-mini-projects](python/03-mini-projects/) | password-strength-checker, auth-log-analyzer, file-hash-verifier |
| [databases/postgresql](databases/postgresql/) | lab-01-library, lab-02-online-shop, lab-03-university |
| [other-languages/c](other-languages/c/) | caesar-cipher, stack-vs-heap-demo, file-line-counter |
| [other-languages/javascript](other-languages/javascript/) | url-slugify, json-config-validator, fizzbuzz-cli |
| [other-languages/bash](other-languages/bash/) | system-report, safe-backup, duplicate-finder |
| [web-projects](web-projects/) | portfolio-site, network-ports-cheatsheet, password-generator |

Русская версия: код написан Claude по промптам Мансура, об этом сказано в README каждой работы. Практические работы по вузу здесь не генерируются.
