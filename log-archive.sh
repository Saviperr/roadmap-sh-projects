#!/bin/bash

# Check input
if [ -z "$1" ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR=$1

# Check directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory does not exist"
  exit 1
fi

# Archive folder
ARCHIVE_DIR="./archives"
mkdir -p "$ARCHIVE_DIR"

# Timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive filename
ARCHIVE_FILE="logs_archive_${TIMESTAMP}.tar.gz"

# Compress logs
tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" "$LOG_DIR"

# Log entry
echo "[$(date)] Archived $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_FILE" >> archive.log

# Output
echo "Archive created: $ARCHIVE_DIR/$ARCHIVE_FILE"
