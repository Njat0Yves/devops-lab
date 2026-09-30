#!/bin/bash

echo "=========================================="
echo "           LINUX LOG ANALYZER"
echo "=========================================="

echo
echo "SYSTEM ERRORS"
echo "------------------------------------------"

ERROR_COUNT=$(journalctl -p err --since "24 hours ago" --no-pager 2>/dev/null | grep -c '^')

echo "Errors in the last 24 hours: $ERROR_COUNT"

echo
echo "RECENT ERRORS"
echo "------------------------------------------"

journalctl -p err --since "24 hours ago" --no-pager -n 10

echo
echo "RECENT WARNINGS"
echo "------------------------------------------"

journalctl -p warning --since "24 hours ago" --no-pager -n 10

echo
echo "FAILED SYSTEMD SERVICES"
echo "------------------------------------------"

systemctl --failed --no-pager

echo
echo "=========================================="
echo "Log analysis completed."
echo "=========================================="