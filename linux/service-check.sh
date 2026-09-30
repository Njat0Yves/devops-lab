#!/bin/bash

SERVICES=(
    "ssh"
    "docker"
)

FAILED=0

echo "=========================================="
echo "         LINUX SERVICE CHECKER"
echo "=========================================="

for SERVICE in "${SERVICES[@]}"; do

    echo
    echo "Checking: $SERVICE"

    if systemctl is-active --quiet "$SERVICE"; then
        echo "Status : RUNNING"
    else
        echo "Status : NOT RUNNING"
        FAILED=1
    fi

done

echo
echo "=========================================="

if [ "$FAILED" -eq 0 ]; then
    echo "All services are running."
else
    echo "One or more services are not running."
fi

echo "=========================================="

exit "$FAILED"