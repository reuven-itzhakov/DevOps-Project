#!/bin/bash

# 1. Define variables
SOURCE_DIR=~/personal
# Create a timestamp in format: YYYYMMDDHHMMSS
TIMESTAMP=$(date +%Y%m%d%H%M%S)
DEST_DIR=~/backup_archive_$TIMESTAMP

# Check if the source directory exists before starting
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory $SOURCE_DIR does not exist."
  exit 1
fi

# 2. Perform backup (recursive copy)
echo "Copying $SOURCE_DIR to $DEST_DIR..."
cp -r "$SOURCE_DIR" "$DEST_DIR"

# 3. Rotation: keep only the 3 most recent backups
# Explanation of the command:
# ls -dt: lists all directories matching backup_archive_* sorted by time (newest first)
# tail -n +4: skips the first 3 lines (the newest backups) and passes the rest (older ones)
# xargs -r rm -rf: takes the list of old backups and removes them (-r avoids errors if the list is empty)

ls -dt ~/backup_archive_* | tail -n +4 | xargs -r rm -rf

# 4. Show final result (as in the image you sent)
echo "Done. Current backups list:"
ls -ld ~/backup_archive_*