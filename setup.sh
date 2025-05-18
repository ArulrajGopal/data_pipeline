#!/bin/bash

# Set project path
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd
VENV_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"


echo "Project directory: $PROJECT_DIR"
echo "Virtual environment directory: $VENV_DIR"

# Check Python version
python3 --version

# Install pip if missing
if ! command -v pip3 &> /dev/null
then
    echo "pip3 not found, installing..."
    sudo apt install -y python3-pip
else
    echo "pip3 is already installed."
fi

# Install venv if missing
sudo apt install -y python3-venv

# Create virtual environment if it doesn't exist
python3 -m venv "$VENV_DIR"

# Activate virtual environment and move to project directory
echo "Activating virtual environment and changing to project directory..."
source "$VENV_DIR/bin/activate"
cd "$PROJECT_DIR"



# Check if PostgreSQL is already installed
if command -v psql >/dev/null 2>&1; then
    echo "PostgreSQL is already installed. Version: $(psql --version)"
else
    echo "PostgreSQL not found. Installing..."

    # Update package list
    sudo apt update

    # Install PostgreSQL
    sudo apt install -y postgresql postgresql-contrib

    # Enable and start PostgreSQL service
    sudo systemctl enable postgresql
    sudo systemctl start postgresql

    echo "PostgreSQL installation complete."
    echo "Installed version: $(psql --version)"
fi


# Desired password for the 'postgres' user
POSTGRES_PASSWORD="Arulraj@1234"

# Set password for the 'postgres' user
echo "Setting password for the 'postgres' PostgreSQL user..."

# Run the password command in the postgres user's psql shell
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '${POSTGRES_PASSWORD}';"

echo "Password for 'postgres' user has been set."


# Install dependencies
echo "Installing dependencies from requirements.txt..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Dependencies installed successfully."


