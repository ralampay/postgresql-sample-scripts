DB_NAME=$1 # ./restore_logical_backup.sh pims_development test.dump
DUMP_FILE=$2 # *.dump*
DB_USER=developer
DB_PASSWORD=password
DB_HOST=localhost
DB_PORT=5432

# Expects environment variable PGPASSWORD to be used as password
# Set up PGPASSWORD
export PGPASSWORD=$DB_PASSWORD 

# Drop and create entire database
dropdb -h $DB_HOST -U $DB_USER $DB_NAME
createdb -h $DB_HOST -U $DB_USER $DB_NAME

for file in $(ls $DUMP_FILE | sort -V); do 
  echo "Restore chunk $file"

  cmd="psql -h $DB_HOST -d $DB_NAME -U $DB_USER -f $file"
  `$cmd`
done

# Unset PGPASSWORD
unset PGPASSWORD

echo "Done."
