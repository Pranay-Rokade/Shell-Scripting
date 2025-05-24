#!/bin/bash

<< readme
# This script is used to backup with 3 days rotation

Usage:
  ./backup.sh <source_directory> <destination_directory>
readme

function display_usage() {
   echo "Usage: ./backup.sh <source_directory> <destination_directory>"
}

if [ $# -eq 0 ]; then
    display_usage
fi

source_directory=$1
destination_directory=$2
timestamp=$(date +%Y-%m-%d_%H-%M-%S)

function backup() {
    if [ ! -d "$source_directory" ]; then
        echo "Source directory does not exist."
        exit 1
    fi

    if [ ! -d "$destination_directory" ]; then
        mkdir -p "$destination_directory"
    fi

    # Create a backup with timestamp
    zip -r "${destination_directory}/backup_${timestamp}.zip" "${source_directory}" > /dev/null

    if [ $? -eq 0 ]; then
        echo "Backup created successfully at ${timestamp}."
    fi
    
}

function rotation(){
    # Rotate backups, keeping only the latest 3
    backups = ($(ls -t "${destination_directory}/backup_*.zip" 2>/dev/null))

    if [ "${#backups[@]}" -gt 3 ]; then
        echo "Performing rotation for three days"

        backups_to_remove = ("${backups[@]:3}")

        for backup in "${backups_to_remove[@]}"; do
            rm -f ${backup}
        done

        echo "Old backups removed, keeping only the latest 3."
    fi
}

backup
rotation

# For Automation
# crontab -e
# 0 0 * * * /path/to/backup.sh /path/to/source /path/to/destination