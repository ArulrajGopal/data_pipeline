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

# # Create virtual environment inside project directory if it doesn't exist
# if [ ! -d "$VENV_DIR" ]; then
#     python3 -m venv "$VENV_DIR"
#     echo "Virtual environment created at $VENV_DIR"
# else
#     echo "Virtual environment already exists at $VENV_DIR"
# fi

# # Activate virtual environment and move to project directory
# echo "Activating virtual environment and changing to project directory..."
# source "$VENV_DIR/bin/activate"
# cd "$PROJECT_DIR"
