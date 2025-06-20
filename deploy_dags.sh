#!/bin/bash

# Set project path
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd
VENV_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

echo "Project directory: $PROJECT_DIR"
echo "Virtual environment directory: $VENV_DIR"



SOURCE_DIR="$PROJECT_DIR/dags/"
DEST_DIR="$VENV_DIR/airflow/dags"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy all files (not directories) from source to destination
cp -a "$SOURCE_DIR"/* "$DEST_DIR"/

echo "echo Files copied successfully from $SOURCE_DIR to $DEST_DIR"


DAGS_DIR="$VENV_DIR/airflow/dags"

for file in "$DAGS_DIR"/*.py; do
    echo "Registering: $file"
    python "$file"
done

echo "Registered all the dags successfully, it will take few mins to reflect in UI"


