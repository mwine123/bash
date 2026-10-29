#!/bin/bash

echo -e "WELCOME."

server=$(hostname)

read -p "Provide the server's environment: " ENV

if [ -z "$ENV" ]; then
    echo "ERROR: Input an environment"
    exit 1
elif [ "$ENV" = production ] || [ "$ENV" = staging ] || [ "$ENV" = development ]; then
    echo -e "Server: $server\nEnvironment: $ENV\nHealth check is starting..."
else 
    echo "ERROR: Not a valid environment"
    exit 1
fi

health=$(systemctl is-active nginx)

if [ "$?" -ne 0 ]; then
    echo "Nginx: UNHEALTHY"
    echo "$health"
else 
    echo "Nginx: HEALTHY"
fi 

usage=$(df -h / | awk 'NR==2 {print $5}')
echo "Disk usage: $usage"
if [ "${usage%\%}" -ge 80 ]; then
    echo "Disk: WARNING-High Usage"
else
    echo "Disk: HEALTHY"
fi