version: "3.9"
services:
  # New Backup Service for remote database
  db_backup:
    image: bash:latest # Use a lightweight Bash container
    container_name: db-backup-container
    volumes:
      - ./db_backups:/backups # Store backups on host
      - ./backup.sh:/backup.sh # Mount custom backup script
    environment:
      MYSQL_HOST: 38.242.231.202  # Remote database IP
      MYSQL_PORT: 6200           # Remote database port
      MYSQL_USER: root           # Database user
      MYSQL_PASSWORD: J6bDrh24   # Database password
      MYSQL_DATABASE: ict_lms    # Database to back up
    entrypoint: /bin/sh -c "apk add --no-cache mysql-client && while true; do sh /backup.sh; sleep 86400; done"
      # Run backup every 24 hours (or set your preferred interval)
      
volumes:
  db_backups: # Store backups on host
