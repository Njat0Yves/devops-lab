# Network Diagnostics

A collection of Bash utilities for inspecting and testing Linux network configuration and connectivity.

## Tools

### network-info.sh

Displays useful information about the local network configuration:

* Hostname
* Network interfaces
* IP addresses
* Default gateway
* Routing table
* Listening ports
* DNS configuration

Run:

```bash
./network-info.sh
```

### network-check.sh

Tests network connectivity against a predefined list of targets.

The script checks whether the configured targets are reachable and returns an appropriate exit code.

Run:

```bash
./network-check.sh
```

## Requirements

* Linux
* Bash
* `iproute2`
* `iputils-ping`
* `ss`

## Purpose

These tools are part of the `devops-lab` project and are intended to provide hands-on practice with Linux networking, troubleshooting, and infrastructure diagnostics.
