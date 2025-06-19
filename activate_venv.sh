#!/bin/bash

cd
VENV_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"


echo "Project directory: $PROJECT_DIR"
echo "Virtual environment directory: $VENV_DIR"
