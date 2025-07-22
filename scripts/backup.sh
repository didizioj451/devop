#!/bin/bash
BACKUP_DIR="backups"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p $BACKUP_DIR
echo " Création de la sauvegarde..."
# Sauvegarde de la base de données
docker-compose exec -T db pg_dump -U django djangodb >
$BACKUP_DIR/db_backup_$DATE.sql
echo " Sauvegarde créée: $BACKUP_DIR/db_backup_$DATE.sql"