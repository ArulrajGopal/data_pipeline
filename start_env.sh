#!/bin/bash

# Check if Python is installed
if ! command -v python3 &>/dev/null; then
    echo "Python is not installed. Installing..."
    sudo apt update
    sudo apt install -y python3
else
    echo "Python is already installed."


cd
source /home/Arulraj/myenv/bin/activate
cd Desktop/data_pipeline


fi