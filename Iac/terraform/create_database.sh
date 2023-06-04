#!/bin/bash

USERNAME="$RDS_USERNAME"
PASSWORD="$RDS_PASSWORD"
DATABASE_NAME="$RDS_DATABASE_NAME"

# Retrieve the RDS endpoint using the AWS CLI
RDS_ENDPOINT=$(aws rds describe-db-instances --query "DBInstances[0].Endpoint.Address" --output text)

# Connect to the RDS instance and create the database
mysql -h "$RDS_ENDPOINT" -u "$USERNAME" -p"$PASSWORD" <<EOF
CREATE DATABASE $DATABASE_NAME;
EOF

# Check if the database creation was successful
if [ $? -eq 0 ]; then
  echo "Database $DATABASE_NAME created successfully."
else
  echo "Error creating database $DATABASE_NAME."
fi
