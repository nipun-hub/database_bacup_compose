#!/bin/bash

# Define variables
BACKUP_DIR="/backups"
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/ict_lms_backup_$DATE.sql"

# Perform the backup using mysqldump
mysqldump \
  -h $MYSQL_HOST \
  -P $MYSQL_PORT \
  -u $MYSQL_USER \
  -p$MYSQL_PASSWORD \
  $MYSQL_DATABASE > $BACKUP_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "[$(date)] Backup successful: $BACKUP_FILE"
else
  echo "[$(date)] Backup failed!"
fi
