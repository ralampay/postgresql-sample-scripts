DB_USER=developer
DB_PASSWORD=password
DB_HOST=localhost
DB_PORT=5432
DIR_BACKUP=/tmp/pgbackup

# Expects environment variable PGPASSWORD to be used as password
# Set up PGPASSWORD
export PGPASSWORD=$DB_PASSWORD 

pg_basebackup \
  -h $DB_HOST \
  -U $DB_USER \
  -D $DIR_BACKUP \
  -Ft -Xs -P

# Unset PGPASSWORD
unset PGPASSWORD

echo "Done."
