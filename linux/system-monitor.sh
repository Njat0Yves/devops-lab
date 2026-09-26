#!/bin/bash

echo "=========================================="
echo "        LINUX SYSTEM MONITOR"
echo "=========================================="

echo
echo "SYSTEM INFORMATION"
echo "------------------------------------------"

echo "Hostname : $(hostname)"
echo "OS       : $(. /etc/os-release && echo "$PRETTY_NAME")"
echo "Kernel   : $(uname -r)"
echo "Uptime   : $(uptime -p)"

echo
echo "CPU"
echo "------------------------------------------"

echo "CPU Usage :"
top -bn1 | grep "Cpu(s)" | awk '{print "  " $2 "% user, " $4 "% system, " $8 "% idle"}'

echo
echo "MEMORY"
echo "------------------------------------------"

free -h | awk 'NR==2 {
    printf "  Total : %s\n  Used  : %s\n  Free  : %s\n", $2, $3, $4
}'

echo
echo "DISK"
echo "------------------------------------------"

df -h / | awk 'NR==2 {
    printf "  Total : %s\n  Used  : %s (%s)\n  Free  : %s\n", $2, $3, $5, $4
}'

echo
echo "LOGGED-IN USERS"
echo "------------------------------------------"

who

echo
echo "TOP PROCESSES"
echo "------------------------------------------"

ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

echo
echo "=========================================="
echo "Monitoring completed."
echo "=========================================="