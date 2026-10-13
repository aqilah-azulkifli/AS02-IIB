#!/bin/bash
# sysinfo.sh - Enhanced system information reporter with logging

# Configuration
LOG_DIR="$HOME/ds1202-project/log"
LOG_FILE="$LOG_DIR/sysinfo-$(date +%Y%m%d-%H%M%S).log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S UTC")

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Function to write both to screen and log
write_output() {
    echo -e "$1" | tee -a "$LOG_FILE"
}

# ===== REPORT =====
write_output "=========================================="
write_output "System Information Report"
write_output "Generated: $TIMESTAMP"
write_output "=========================================="
write_output ""

# Basic system
write_output "Hostname:        $(hostname)"
write_output "OS Version:      $(lsb_release -d | cut -f2)"
write_output "Kernel Version:  $(uname -r)"
write_output "Uptime:          $(uptime -p)"
write_output ""

# CPU Load
LOAD_1=$(awk '{print $1}' /proc/loadavg)
LOAD_5=$(awk '{print $2}' /proc/loadavg)
LOAD_15=$(awk '{print $3}' /proc/loadavg)
write_output "CPU Load (1/5/15 min):  $LOAD_1, $LOAD_5, $LOAD_15"

# Disk usage for /
ROOT_USAGE=$(df / --output=pcent | awk 'NR==2 {print $1}')
ROOT_USED=$(df / --output=used --si | awk 'NR==2 {print $1}')
ROOT_TOTAL=$(df / --output=size --si | awk 'NR==2 {print $1}')
write_output "Disk / Usage:            $ROOT_USAGE of $ROOT_TOTAL"

# Memory usage
MEM_TOTAL=$(free -h | awk '/Mem:/ {print $2}')
MEM_USED=$(free -h | awk '/Mem:/ {print $3}')
MEM_PERCENT=$(free | awk '/Mem:/ {printf "%.0f%%", $3/$2 * 100.0}')
write_output "Memory Usage:           $MEM_PERCENT ($MEM_USED / $MEM_TOTAL)"

# Swap usage
SWAP_PERCENT=$(free | awk '/Swap:/ {if ($2 > 0) printf "%.0f%%", $3/$2 * 100.0; else print "0%"}')
write_output "Swap Usage:             $SWAP_PERCENT"

# Network addresses
IP_ETH0=$(ip -4 addr show eth0 2>/dev/null | awk '/inet/ {print $2}' | cut -d/ -f1)
IP_DEFAULT=$(curl -s ifconfig.me)
write_output "IPv4 (eth0):            ${IP_ETH0:-Not available}"
write_output "Public IPv4:            ${IP_DEFAULT:-Not available}"

# Processes & users
PROCS=$(ps -e | wc -l)
USERS=$(who | wc -l)
write_output "Running Processes:      $PROCS"
write_output "Active Users:          $USERS"

write_output ""
write_output "Report saved to: $LOG_FILE"
write_output "=========================================="
