#!/bin/bash

echo "=========================================="
echo "          NETWORK INFORMATION"
echo "=========================================="

echo
echo "HOSTNAME"
echo "------------------------------------------"
hostname

echo
echo "NETWORK INTERFACES"
echo "------------------------------------------"
ip -br addr

echo
echo "DEFAULT ROUTE"
echo "------------------------------------------"
ip route | grep default

echo
echo "ROUTING TABLE"
echo "------------------------------------------"
ip route

echo
echo "LISTENING PORTS"
echo "------------------------------------------"
ss -tuln

echo
echo "DNS CONFIGURATION"
echo "------------------------------------------"

if command -v resolvectl >/dev/null 2>&1; then
    resolvectl status | grep -E "DNS Servers|Current DNS Server"
else
    cat /etc/resolv.conf
fi

echo
echo "=========================================="
echo "Network information collected."
echo "=========================================="