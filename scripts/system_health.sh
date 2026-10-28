#!/bin/bash

#devOps BAsh Automation Toolkit
#Project 1: System Health Monitor

set -u

BASE_DIR="$HOME/Desktop/linux/bash-automation"
LOG_FILE="$BASE_DIR/logs/system-health.log"

mkdir -p "$BASE_DIR/logs"

{
	echo "=========================================="
	echo "          SYSTEM HEALTH REPORT"
	echo "=========================================="
	echo "Date	:$(date '+%Y-%m-%d %H:%M:%S')"
	echo "Hostname	:$(hostname)"
	echo "Current user: $(whoami)"
	echo

	echo "------ SYSTEM UPTIME AND LOAD ------"
	uptime
	echo

	echo "------ MEMORY USAGE ------"
	free -h
	echo

	echo "------ ROOT DISK USAGE ------"
	df -h /
	echo

	echo "------ TOP PROCESSES ------"
	ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
	echo

	echo "------ HEALTH SUMMARY ------"

	MEMORY_USED=$(free |awk '/^Mem:/ {printf "%.0f\n", $3/$2*100}')
	DISK_USED=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

	echo "Memory used: ${MEMORY_USED}%"
	echo "Root disk used: ${DISK_USED}%"

	if [ "$MEMORY_USED" -ge 80 ]; then
		echo "WARNING: Memory usage is high!"
	else
		echo "OK: Memory usage is within the configured threshold."
	fi
	if [ "$DISK_USED" -ge 80 ]; then
		echo "WARNING: Root disk usage is high!"
	else
		echo "OK: Root disk usage is within the configured thresshoold."
	fi

	echo "Report completed."
	echo
} | tee -a "$LOG_FILE"
