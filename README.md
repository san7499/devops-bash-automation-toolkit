# 🚀 DevOps Bash Automation Toolkit

A hands-on DevOps project built using Bash scripting on Ubuntu Linux. This toolkit automates common system administration tasks, log analysis, backups, and scheduled health checks.

## 📌 Project Overview

The **DevOps Bash Automation Toolkit** is designed to simplify repetitive Linux administration tasks through shell scripting. It includes a menu-driven master script that allows users to run different automation utilities from one place.

## ✨ Features

### 1. System Health Monitor
- Displays system hostname, current user, date, and uptime.
- Checks memory usage and root disk usage.
- Displays top CPU-consuming processes.
- Generates system health reports.

### 2. Log Analyzer
- Searches application logs for `ERROR`, `WARNING`, and `INFO` messages.
- Counts matching log entries.
- Displays error and warning details.
- Handles missing log files.

### 3. Backup Automation
- Creates compressed `.tar.gz` archives.
- Adds timestamps to backup filenames.
- Verifies that the backup archive can be read.
- Supports repeated backups without overwriting previous timestamped archives.

### 4. Cron Scheduler
- Schedules automatic system health checks using cron.
- Appends command output and errors to a log file.
- Demonstrates Linux task scheduling and output redirection.

### 5. Master Menu
- Runs the individual scripts from a single interactive menu.
- Provides options for system monitoring, log analysis, backups, and viewing health logs.
- Handles invalid menu choices.

## 🛠️ Tech Stack

- **Operating System:** Ubuntu Linux
- **Scripting Language:** Bash
- **Scheduling:** Cron
- **Linux Utilities:** `grep`, `awk`, `tar`, `df`, `free`, `ps`, `uptime`
- **Version Control:** Git and GitHub

## 📁 Project Structure

```text
devops-bash-automation-toolkit/
├── scripts/
│   ├── system_health.sh
│   ├── log_analyzer.sh
│   ├── backup.sh
│   └── master.sh
├── test-data/
│   └── important-files/
├── logs/       # Generated logs; excluded from Git
├── backups/    # Generated archives; excluded from Git
├── .gitignore
└── README.md
```

## ⚙️ Prerequisites

- Ubuntu Linux or another compatible Linux distribution
- Bash shell
- Git
- Standard Linux utilities used by the scripts
- Cron for scheduled automation

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/san7499/devops-bash-automation-toolkit.git
cd devops-bash-automation-toolkit
```

### 2. Make the scripts executable

```bash
chmod +x scripts/*.sh
```

### 3. Run the master menu

```bash
./scripts/master.sh
```

Select an option from the menu to run the desired utility.

## ▶️ Run Individual Scripts

### System Health Monitor

```bash
./scripts/system_health.sh
```

### Log Analyzer

```bash
./scripts/log_analyzer.sh
```

### Backup Automation

```bash
./scripts/backup.sh
```

**Note:** The scripts use paths relative to the user's home directory in their current configuration. If you clone the project to a different location, review and update the `BASE_DIR` and log file paths in the scripts before running them.

## ⏰ Cron Scheduling

The system health monitor can be scheduled to run every five minutes using `crontab -e`.

Example:

```cron
*/5 * * * * /usr/bin/bash /absolute/path/to/scripts/system_health.sh >> /absolute/path/to/logs/cron-health.log 2>&1
```

Replace the example paths with the actual absolute paths on your machine. Create the log directory before enabling the job.

To inspect scheduled jobs:

```bash
crontab -l
```

## 🔍 Validation and Troubleshooting

Check Bash syntax before running a script:

```bash
bash -n scripts/system_health.sh
bash -n scripts/log_analyzer.sh
bash -n scripts/backup.sh
bash -n scripts/master.sh
```

Inspect recent cron output:

```bash
tail -n 30 logs/cron-health.log
```

## 🎯 Learning Outcomes

Through this project, I practised:

- Linux command-line operations
- Bash variables, conditions, loops, and scripting
- Log searching and text processing
- Automated backups and archive verification
- Cron scheduling and output redirection
- Troubleshooting shell scripts
- Git version control and GitHub repository management

## 👨‍💻 Author

**Sanket Khapake**

- GitHub: [san7499](https://github.com/san7499)
- LinkedIn: [Sanket Khapake](https://www.linkedin.com/in/sanket-khapake/)

---

*Built as a hands-on project to practise Linux administration and DevOps automation.*
