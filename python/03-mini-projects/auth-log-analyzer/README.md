# Auth log analyzer

Counts failed SSH password attempts per IP and per username and flags IPs above a threshold. The sample log uses documentation-reserved IP addresses (RFC 5737), not real hosts.

> Written by Claude (Anthropic AI) from prompts by Mansur Karashashev. AI-generated code: read it and run it before relying on it.

## Use
Run it only on logs from systems you own or administer.

## Run
```bash
python analyze.py sample_auth.log 3
```

## Test
```bash
python -m unittest test_analyze.py
```

## Limits
Matches the common OpenSSH "Failed password" format only.
