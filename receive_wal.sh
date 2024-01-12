DB_USER=developer
DB_PASSWORD=password
DB_HOST=192.168.100.54
DB_PORT=5432
BACKUP_DIR=/tmp/walstream
# Expects environment variable PGPASSWORD to be used as password
# Set up PGPASSWORD
export PGPASSWORD=$DB_PASSWORD 

pg_receivewal -h $DB_HOST -U $DB_USER -D $BACKUP_DIR -v

unset PGPASSWORD
