# DS1202 Project — System Information Script

## About This Project
This project sets up a structured working environment and includes a Bash script `sysinfo.sh` that collects and reports key system metrics. It features automatic logging of reports to timestamped files and follows a Git feature-branch workflow.

---

## What `sysinfo.sh` Reports
- Hostname, operating system, kernel version
- System uptime
- CPU load averages (1/5/15 minutes)
- Disk usage for the root filesystem
- Memory and swap usage percentage
- Network IP addresses (local `eth0` and public)
- Number of running processes and active logged-in users
- Saves every full report to a log file in `log/`

---

## Setup Instructions

### 1. Directory Structure
Created with:
```bash
mkdir -p ~/ds1202-project/{scripts,docs,log}
