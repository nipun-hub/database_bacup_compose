#!/bin/sh

# Database credentials
HOST=$MYSQL_HOST
PORT=$MYSQL_PORT
USER=$MYSQL_USER
PASSWORD=$MYSQL_PASSWORD
DATABASE=$MYSQL_DATABASE

# Backup filename
BACKUP_FILE="/backups/backup_$(date +'%Y-%m-%d_%H-%M-%S').sql"

# Run mysqldump to create a backup
mysqldump -h $HOST -P $PORT -u $USER -p$PASSWORD $DATABASE > $BACKUP_FILE

# Optionally, compress the backup
gzip $BACKUP_FILE
