#!/bin/bash

set -o pipefail

if [ -z "$1" ]; then 
    echo "Usage: $0 <filesystem>"
    exit 1
fi

if usage=$(df -h "$1" | awk 'NR==2 {print $5}' | tr -d '%')code; then 
    echo "df worked"
else
    echo "df failed"
    exit 1
fi

echo "disk usage - ${usage}%"

if [ "$usage" -ge 80 ]; then
    echo "WARNING"
    exit 1
else
    echo "ok"
fi
