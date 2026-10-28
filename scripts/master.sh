#!/bin/bash

BASE_DIR="$HOME/Desktop/linux/bash-automation"
SCRIPTS_DIR="$BASE_DIR/scripts"

while true; do
	echo "========================================"
	echo "  DEVOPS AUTOMATION TOOLKIT"
	echo "========================================"
	echo "1. System Health Monitor"
	echo "2. Log Analyzer"
	echo "3. Backup Automation"
	echo "4. View Latest Health log"
	echo "5. Exit"
	echo "========================================"
	read -r -p "Enter your choice [1-5]: " choice
	case "$choice" in
		1)
			/usr/bin/bash "$SCRIPTS_DIR/system_health.sh"
			;;
		2)
			/usr/bin/bash "$SCRIPTS_DIR/log_analyzer.sh"
			;;
		3)
			/usr/bin/bash "$SCRIPTS_DIR/backup.sh"
			;;
		4)
			if [ -f "$BASE_DIR/logs/cron-health.log" ];  then
				tail  -n 30 "$BASE_DIR/logs/cron-health.log"
			else
				echo "Health log not found yet."
			fi
			;;
		5)
			echo "Exiting Devops Automation Toolkit. Goodbye!"
			break
			;;
		*)
			echo "Invalid choice. Please enter a number from 1 to 5."
			;;
	esac
done
