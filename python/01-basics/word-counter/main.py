"""Count the most frequent words in a text file (Russian and English)."""
import re
import sys
from collections import Counter

WORD = re.compile(r"[A-Za-zА-Яа-яЁё]+(?:'[A-Za-z]+)?")


def count_words(text: str) -> Counter:
    return Counter(w.lower() for w in WORD.findall(text))


def main(path: str, top: int = 10) -> None:
    with open(path, encoding="utf-8") as f:
        counts = count_words(f.read())
    for word, n in counts.most_common(top):
        print(f"{n:5d}  {word}")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit("Usage: python main.py FILE [TOP]")
    main(sys.argv[1], int(sys.argv[2]) if len(sys.argv) > 2 else 10)
