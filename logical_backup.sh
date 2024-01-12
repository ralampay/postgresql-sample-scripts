DB_NAME=$1 # ./logical_backup.sh pims_development
DB_USER=developer
DB_PASSWORD=password
DB_HOST=localhost
DB_PORT=5432
DUMP_FILE=$(date +%s)-$DB_NAME.dump

# Expects environment variable PGPASSWORD to be used as password
# Set up PGPASSWORD
export PGPASSWORD=$DB_PASSWORD 

# Invoke command
pg_dump \
  -h $DB_HOST \
  -d $DB_NAME \
  -U $DB_USER \
  --verbose --clean --no-owner --no-acl \
  --format=c > $DUMP_FILE

# Unset PGPASSWORD
unset PGPASSWORD

echo "Done."
