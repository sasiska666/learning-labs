#!/usr/bin/env bash
# Print a short read-only system report: host, kernel, uptime, disk, memory.
set -euo pipefail

echo "Host:    $(hostname)"
echo "Kernel:  $(uname -sr)"
echo "Uptime:  $(uptime -p 2>/dev/null || uptime)"
echo "--- Disk (root) ---"
df -h / | awk 'NR==1 || NR==2'
echo "--- Memory ---"
if command -v free >/dev/null; then free -h | awk 'NR<=2'; else echo "free not available"; fi
