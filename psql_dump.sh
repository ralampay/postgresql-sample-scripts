DB_NAME=$1 # ./logical_backup.sh pims_development
DB_USER=developer
DB_PASSWORD=password
DB_HOST=localhost
DB_PORT=5432

QUERY="SELECT * FROM USERS"

# Expects environment variable PGPASSWORD to be used as password
# Set up PGPASSWORD
export PGPASSWORD=$DB_PASSWORD 

psql \
  -U $DB_USER \
  -d $DB_NAME \
  -h $DB_HOST \
  -c "$QUERY" > output.sql
