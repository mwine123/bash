#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
elif [ -f "$1" ]; then
    echo "file exists"
else
    echo "ERROR: Log file doesnt extst"
    exit 1
fi 

error_count=$(grep "ERROR" "$1" | wc -l)
warning_count=$(grep "WARNING" "$1" | wc -l)
info_count=$(grep "INFO" "$1" | wc -l)
critical_count=$(grep "CRITICAL" "$1" | wc -l)

echo "Log Analysis Report
-------------------
Total errors: $error_count
Total warnings: $warning_count
Total info messages: $info_count
Total critical events: $critical_count"

if [ $critical_count -gt 0 ]; then
    echo "ALERT: Critical events detected!"
else 
    echo "No critical events detected."
fi