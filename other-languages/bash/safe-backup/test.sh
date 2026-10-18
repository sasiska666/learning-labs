#!/usr/bin/env bash
set -euo pipefail
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
mkdir "$tmp/src"; echo hi > "$tmp/src/a.txt"
./backup.sh "$tmp/src" "$tmp/out" >/dev/null
ls "$tmp/out"/*.tar.gz >/dev/null && echo "backup OK"
if ./backup.sh "$tmp/missing" "$tmp/out" 2>/dev/null; then echo "FAIL"; exit 1; else echo "missing source rejected OK"; fi
