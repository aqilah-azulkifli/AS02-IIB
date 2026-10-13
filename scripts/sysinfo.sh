#!/bin/bash
# sysinfo.sh - Display basic system information

echo "=== System Information ==="
echo "Hostname:    $(hostname)"
echo "OS:          $(lsb_release -d | cut -f2)"
echo "Kernel:      $(uname -r)"
echo "Date/Time:   $(date)"
echo "Uptime:      $(uptime -p)"
echo ""
echo "=== Disk Usage ==="
df -h ~
echo ""
echo "=== Memory ==="
free -h
echo ""
echo "=== Users Logged In ==="
who
echo "=========================="
