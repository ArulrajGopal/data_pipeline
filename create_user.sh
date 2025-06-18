#!/bin/bash

# Set Airflow user details
AIRFLOW_USERNAME="Arulraj1"
AIRFLOW_PASSWORD="Arulraj@1234"
AIRFLOW_FIRSTNAME="Arulraj"
AIRFLOW_LASTNAME="Gopal"
AIRFLOW_ROLE="Admin"
AIRFLOW_EMAIL="arulrajgopal@outlook.com"

# Run Airflow DB migration
echo "Running airflow db migrate..."
airflow db migrate

# Create Airflow user
echo "Creating Airflow user..."
airflow users create \
    --username "$AIRFLOW_USERNAME" \
    --password "$AIRFLOW_PASSWORD" \
    --firstname "$AIRFLOW_FIRSTNAME" \
    --lastname "$AIRFLOW_LASTNAME" \
    --role "$AIRFLOW_ROLE" \
    --email "$AIRFLOW_EMAIL"

echo "User '$AIRFLOW_USERNAME' created successfully."
