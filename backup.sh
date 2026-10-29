#!/bin/bash

read -p "Directory to backup path: " dir_path

if [ -z "$dir_path" ]; then
    echo "Error: enter a directory"
    exit 1
elif [ ! -d "$dir_path" ]; then
    echo "Error: Directory does not exist"
    exit 1
fi

read -p "Backup path: " backup

if [ -z "$backup" ]; then
    echo "Error: Enter where you want the backup to be saved" 
    exit 1
fi

echo "Backing up $dir_path..."

if [ ! -d "$backup" ]; then
    mkdir "$backup"
    if [ $? -ne 0 ]; then
        echo "Error: failed to create backup directory"
        exit 1
    fi
fi

cp -r "$dir_path" "$backup"
if [ $? -ne 0 ]; then
    echo "Error: failed to copy files to backup"
    exit 1
fi

echo "Backup completed successfully."