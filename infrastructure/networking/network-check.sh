#!/bin/bash

TARGETS=(
    "1.1.1.1"
    "8.8.8.8"
    "github.com"
)

echo "=========================================="
echo "           NETWORK CONNECTIVITY"
echo "=========================================="

FAILED=0

for TARGET in "${TARGETS[@]}"; do

    echo
    echo "Checking: $TARGET"

    if ping -c 2 -W 2 "$TARGET" >/dev/null 2>&1; then
        echo "Status : REACHABLE"
    else
        echo "Status : UNREACHABLE"
        FAILED=1
    fi

done

echo
echo "=========================================="

if [ "$FAILED" -eq 0 ]; then
    echo "Network connectivity looks healthy."
else
    echo "One or more connectivity checks failed."
fi

echo "=========================================="

exit "$FAILED"