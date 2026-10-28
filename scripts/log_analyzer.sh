#!/bin/bash

LOG_FILE="$HOME/Desktop/linux/bash-automation/test-data/application.log"

echo "===== LOG ANALYZER REPORTt ======"
echo "Date: $(date)"
echo

if [ ! -f "$LOG_FILE" ]; then
	echo "ERROR: log file not found!"
	exit 1
fi

ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE")
WARNING_COUNT=$(grep -c "WARNING" "$LOG_FILE")
INFO_COUNT=$(grep -c "INFO" "$LOG_FILE")

echo "Ttotaal ERROR messages: $ERROR_COUNT"
echo "Total WArning messages: $WARNING_COUNT"
echo "Totaal INFO messages: $INFO_COUNT"

echo
echo "====== ERROR DETAILS ======"
if grep -q "ERROR" "$LOG_FILE"; then
	grep "ERROR" "$LOG_FILE"
else
	echo "No ERROR found"
fi

echo
echo "====== WARNING DETAILS ======"
grep "WARNING" "$LOG_FILE"

echo
echo "====== INFO DETAILS ======"
grep "INFO" "$LOG_FILE"

echo
echo "Report Completed."
