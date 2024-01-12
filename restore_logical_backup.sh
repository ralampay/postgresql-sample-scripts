DB_NAME=$1 # ./restore_logical_backup.sh pims_development test.dump
DUMP_FILE=$2
DB_USER=developer
DB_PASSWORD=password
DB_HOST=localhost
DB_PORT=5432

# Expects environment variable PGPASSWORD to be used as password
# Set up PGPASSWORD
export PGPASSWORD=$DB_PASSWORD 

# Invoke command
pg_restore \
  -h $DB_HOST \
  -d $DB_NAME \
  -U $DB_USER \
  --verbose --clean --no-owner --no-acl \
  $DUMP_FILE

# Unset PGPASSWORD
unset PGPASSWORD

echo "Done."
