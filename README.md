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
Features

* Displays the hostname.
* Displays the operating system and kernel version.
* Displays CPU load and uptime.
* Displays memory and disk usage.
* Saves the system report to logs/sysinfo-report.txt.

Setup Instructions

1. Generate an Ed25519 SSH key on your local computer using ssh-keygen.
2. Add the public key to the lab server’s ~/.ssh/authorized_keys file.
3. Connect to the lab server using SSH without entering your account password.
4. Create the scripts, docs, and logs directories inside ~/ds1202-project.
5. Set the project directory permissions to 755.
6. Make the script executable using:

chmod +x ~/ds1202-project/scripts/sysinfo.sh

How to Run

From the project directory, run:

./scripts/sysinfo.sh

The script displays system information and saves the report to logs/sysinfo-report.txt.

Example Output

The output includes the hostname, operating system, kernel version, CPU load and uptime, memory usage, and disk usage.

Example:

===== SYSTEM INFORMATION REPORT =====
Hostname: iib-as2
Operating System: Ubuntu 26.04.1 LTS
Kernel Version: 7.0.0-31-generic
CPU Load and Uptime:
Displays current uptime and load averages.
Memory Usage:
Displays total, used, and available memory.
Disk Usage:
Displays filesystem size, used space, and available space.
Report saved to: /home/26FTT1117/ds1202-project/logs/sysinfo-report.txt

Note: The actual values change when the script runs.

Git Workflow

1. Create the initial commit on main.
2. Create the feature-logging branch.
3. Enhance the script to include CPU load, uptime, and report logging.
4. Commit the changes.
5. Merge feature-logging into main and resolve conflicts if needed.
6. Push both branches to GitHub.

Evidence Screenshots

The Task 1 evidence PDF contains:

1. SSH key generation output.
2. Successful passwordless SSH login.
3. ls -la showing project structure and permissions.
4. Enhanced sysinfo.sh output after the merge.
5. git log --graph --oneline --all showing commit history and branches.

GitHub Repository

https://github.com/aqilah-azulkifli/AS02-IIB.git
