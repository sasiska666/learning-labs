#!/usr/bin/env bash
# Create a timestamped .tar.gz of a directory. Never deletes or overwrites anything.
set -euo pipefail

if [ $# -ne 2 ]; then
  echo "Usage: $0 SOURCE_DIR DEST_DIR" >&2
  exit 1
fi
src=$1
dest=$2
[ -d "$src" ] || { echo "Source is not a directory: $src" >&2; exit 1; }
mkdir -p "$dest"
name="$(basename "$(cd "$src" && pwd)")-$(date +%Y%m%d-%H%M%S).tar.gz"
out="$dest/$name"
[ ! -e "$out" ] || { echo "Refusing to overwrite $out" >&2; exit 1; }
tar -czf "$out" -C "$src" .
tar -tzf "$out" >/dev/null   # verify the archive can be read
echo "Created $out"
