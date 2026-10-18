# File hash verifier

Streams a file through SHA-256 (works for large files) and compares it with the checksum published by the vendor. Useful for checking downloads.

> Written by Claude (Anthropic AI) from prompts by Mansur Karashashev. AI-generated code: read it and run it before relying on it.

## Run
```bash
python verify.py file.iso EXPECTED_SHA256
```
Exit code 0 means match, 1 means mismatch.

## Test
```bash
python -m unittest test_verify.py
```
