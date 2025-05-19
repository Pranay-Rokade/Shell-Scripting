#!/bin/bash

# Deploy a React App and handle errors

# Function to clone the React app code
code_clone() {
    echo "Cloning the React app..."
    if [ -d "react-textutils-app" ]; then
        echo "The code directory already exists. Skipping clone."
    else
        git clone https://github.com/Pranay-Rokade/React_First_Project react-textutils-app || {
            echo "Failed to clone the code."
            return 1
        }
    fi
}

# Function to install required dependencies
install_requirements() {
    echo "Installing dependencies..."
    sudo apt-get update && sudo apt-get install -y nodejs npm docker.io docker-compose nginx || {
        echo "Failed to install dependencies."
        return 1
    }
}

# Function to perform required restarts
required_restarts() {
    echo "Performing required restarts..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "Failed to change ownership of docker.sock."
        return 1
    }

    # Optional: Enable and restart Docker and Nginx if needed
    # sudo systemctl enable docker
    # sudo systemctl enable nginx
    # sudo systemctl restart docker
}

# Function to deploy the React app
deploy() {
    echo "Building and deploying the React app..."

    cd react-textutils-app || {
        echo "Failed to enter the app directory."
        return 1
    }

    echo "Installing npm dependencies..."
    npm install || {
        echo "npm install failed."
        return 1
    }

    echo "Building the React app..."
    npm run build || {
        echo "npm build failed."
        return 1
    }

    echo "Starting the app with Docker Compose..."
    docker build -t react-textutils-app . && docker-compose up -d || {
        echo "Docker deployment failed."
        return 1
    }
}

# Main deployment script
echo "********** REACT APP DEPLOYMENT STARTED **********"

# Clone the code
if ! code_clone; then
    exit 1
fi

# Install dependencies
if ! install_requirements; then
    exit 1
fi

# Perform required restarts
if ! required_restarts; then
    exit 1
fi

# Deploy the app
if ! deploy; then
    echo "Deployment failed. Mailing the admin..."
    # Add email or Slack/Discord webhook notification here
    exit 1
fi

echo "********** REACT APP DEPLOYMENT COMPLETE **********"
