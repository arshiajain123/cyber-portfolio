#!/bin/bash
# count failed SSH logins per IP
LOG="${1:-/var/log/auth.log}"
if [ -r "$LOG" ]; then
DATA=$(grep -a "Failed password" "$LOG")
else
DATA=$(journalctl -u ssh --no-pager 2>/dev/null | grep "Failed password")
fi
if [ -z "$DATA" ]; then
echo "No failed SSH logins found."
exit 0
fi
echo "Failed SSH logins per IP:"
echo "$DATA" | grep -oE "from [0-9]+(\.[0-9]+){3}" | awk '{print $2}' | sort | uniq -c | sort -rn | awk '{printf "%-16s %s attempts\n", $2, $1}'
