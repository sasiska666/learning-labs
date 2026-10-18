"""Compute SHA-256 of a file and optionally compare it with an expected hash."""
import hashlib
import hmac
import sys


def sha256_file(path: str, chunk: int = 1 << 20) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        while block := f.read(chunk):
            h.update(block)
    return h.hexdigest()


def matches(actual: str, expected: str) -> bool:
    return hmac.compare_digest(actual.lower(), expected.strip().lower())


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit("Usage: python verify.py FILE [EXPECTED_SHA256]")
    digest = sha256_file(sys.argv[1])
    print(digest)
    if len(sys.argv) > 2:
        ok = matches(digest, sys.argv[2])
        print("OK: hash matches" if ok else "MISMATCH: do not trust this file")
        sys.exit(0 if ok else 1)
