"""Summarize failed SSH logins per IP from an auth log (defensive log analysis)."""
import re
import sys
from collections import Counter

FAILED = re.compile(r"Failed password for (?:invalid user )?(\S+) from (\d{1,3}(?:\.\d{1,3}){3})")


def parse(lines):
    by_ip, by_user = Counter(), Counter()
    for line in lines:
        m = FAILED.search(line)
        if m:
            by_user[m.group(1)] += 1
            by_ip[m.group(2)] += 1
    return by_ip, by_user


def main(path: str, threshold: int = 3) -> None:
    with open(path, encoding="utf-8", errors="replace") as f:
        by_ip, by_user = parse(f)
    print(f"Failed logins: {sum(by_ip.values())}")
    print("Top IPs:")
    for ip, n in by_ip.most_common(5):
        flag = "  <-- review, possible brute force" if n >= threshold else ""
        print(f"  {ip:15s} {n}{flag}")
    print("Top usernames tried:")
    for user, n in by_user.most_common(5):
        print(f"  {user:15s} {n}")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit("Usage: python analyze.py LOGFILE [THRESHOLD]")
    main(sys.argv[1], int(sys.argv[2]) if len(sys.argv) > 2 else 3)
