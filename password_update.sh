# Configuration
DB_USER=developer
DB_PASSWORD=password
DB_HOST=localhost
DB_PORT=5432

# Target User: Pass as argument to the script
# ./password_update.sh developer
TARGET_USER=$1

# Generate a new password
NEW_PASSWORD=$(openssl rand -base64 12)

# Update the user with a new password
cmd="psql -h $DB_HOST -p $DB_PORT -U $DB_USER -c \"ALTER USER $TARGET_USER WITH PASSWORD '$NEW_PASSWORD'\""
echo $cmd

# Log the password change of the user
echo "$(date +"%Y-%m-%d %H:%M:%S"): Password for user $TARGET_USER rotated by $DB_USER" >> /tmp/passlog
