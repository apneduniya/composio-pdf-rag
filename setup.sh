#!/bin/bash

# Create a virtual environment
echo "Creating virtual environment..."
python3 -m venv ~/.venvs/pr-summarizer

# Activate the virtual environment
echo "Activating virtual environment..."
source ~/.venvs/pr-summarizer/bin/activate

# Install libraries from requirements.txt 
echo "Installing libraries from requirements.txt..."
pip install -r requirements.txt

# Login to your account
echo "Login to your Composio acount"
composio login

# Check if the 'static' folder exists, and create it if it doesn't
if [ ! -d "static" ]; then
    echo "Creating 'static' folder..."
    mkdir static
else
    echo "'static' folder already exists."
fi

# Copy env backup to .env file
if [ -f ".env.example" ]; then
    echo "Copying .env.example to .env..."
    cp .env.example .env
else
    echo "No .env.example file found. Creating a new .env file..."
    touch .env
fi

# Prompt user to fill the .env file
echo "Please fill in the .env file with the necessary environment variables."

echo "Setup completed successfully!"
