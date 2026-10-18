"""Password strength checker: length, character classes, common passwords, entropy estimate."""
import math
import string
import sys
from getpass import getpass

COMMON = {
    "123456", "password", "qwerty", "12345678", "111111", "123456789",
    "qwerty123", "iloveyou", "admin", "welcome", "letmein", "йцукен",
}


def charset_size(pw: str) -> int:
    size = 0
    if any(c in string.ascii_lowercase for c in pw):
        size += 26
    if any(c in string.ascii_uppercase for c in pw):
        size += 26
    if any(c in string.digits for c in pw):
        size += 10
    if any(c in string.punctuation for c in pw):
        size += 32
    if any(not c.isascii() for c in pw):
        size += 64
    return size


def entropy_bits(pw: str) -> float:
    """Upper-bound estimate: length * log2(alphabet). Real strength is lower for patterns."""
    size = charset_size(pw)
    return len(pw) * math.log2(size) if size else 0.0


def rate(pw: str) -> tuple[str, list[str]]:
    issues = []
    if pw.lower() in COMMON:
        return "very weak", ["Found in a list of common passwords"]
    if len(pw) < 12:
        issues.append("Shorter than 12 characters")
    if pw.lower() == pw or pw.upper() == pw:
        issues.append("Use both upper and lower case")
    if not any(c.isdigit() for c in pw):
        issues.append("Add digits")
    if len(set(pw)) <= len(pw) // 2:
        issues.append("Too many repeated characters")
    bits = entropy_bits(pw)
    label = "weak" if bits < 45 else "medium" if bits < 70 else "strong"
    if issues and label == "strong":
        label = "medium"
    return label, issues


if __name__ == "__main__":
    pw = sys.argv[1] if len(sys.argv) > 1 else getpass("Password (hidden): ")
    label, issues = rate(pw)
    print(f"Rating: {label}  (~{entropy_bits(pw):.0f} bits, upper bound)")
    for i in issues:
        print(f" - {i}")
