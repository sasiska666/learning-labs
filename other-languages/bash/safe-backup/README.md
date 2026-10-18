# Safe backup (Bash)

Packs a directory into a timestamped `.tar.gz`, verifies the archive and refuses to overwrite existing files. It does not delete anything.

> Written by Claude (Anthropic AI) from prompts by Mansur Karashashev. AI-generated code: read it and run it before relying on it.

```bash
./backup.sh ~/Documents ~/backups
./test.sh
```
