#!/usr/bin/env bash
set -euo pipefail
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
echo same > "$tmp/a.txt"; echo same > "$tmp/b.txt"; echo other > "$tmp/c.txt"
out=$(./dupes.sh "$tmp")
echo "$out" | grep -q "2 files" && echo "duplicates found OK"
echo "$out" | grep -q "c.txt" && { echo "FAIL: unique file listed"; exit 1; } || echo "unique file ignored OK"
