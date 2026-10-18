#!/usr/bin/env bash
# List files with identical content (SHA-256) in a directory. Read-only: reports, never deletes.
set -euo pipefail

[ $# -eq 1 ] && [ -d "$1" ] || { echo "Usage: $0 DIR" >&2; exit 1; }
find "$1" -type f -print0 | xargs -0 sha256sum | sort | awk '
  { hash=$1; $1=""; sub(/^ /,""); files[hash]=files[hash] "\n  " $0; count[hash]++ }
  END { for (h in count) if (count[h] > 1) print "Duplicate group (" count[h] " files):" files[h] }'
