# Password strength checker

Rates a password by length, character classes, a small common-password list and an entropy upper bound. The password is read without echo, so it does not stay in terminal history. Nothing is sent anywhere.

> Written by Claude (Anthropic AI) from prompts by Mansur Karashashev. AI-generated code: read it and run it before relying on it.

## Limits
The entropy number is an upper bound. Dictionary words and patterns make real strength lower. The common-password list is tiny. Use a password manager for real accounts.

## Run
```bash
python checker.py
```

## Test
```bash
python -m unittest test_checker.py
```
