#!/bin/bash
set -e

BASE_DIR="$HOME/Desktop/linux//bash-automation"
SOURCE_DIR="$BASE_DIR/test-data/important-files"
BACKUP_DIR="$BASE_DIR/backups"

TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DIR/important-files-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

if [ ! -d "$SOURCE_DIR" ]; then
	echo "ERROR: Source directory not found!"
	exit 1
fi


echo "Starting backup..."

tar -czf "$BACKUP_FILE" -C "$BASE_DIR/test-data" important-files

if tar -tzf "$BACKUP_FILE" > /dev/null; then
	echo "SUCCESS: Backup created and archive checked."
	echo "Backup file: $BACKUP_FILE"
else
	echo "ERROR: Backup verification failed!"
	exit 1
fi
