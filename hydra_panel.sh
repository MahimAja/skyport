#!/bin/bash

# ASCII Art for Purple Theme
echo -e "\e[35m"  # Set text color to purple
cat << "EOF"
 ██████   ██████   █████████   █████   █████ █████ ██████   ██████    ███████    ███████████ 
░░██████ ██████   ███░░░░░███ ░░███   ░░███ ░░███ ░░██████ ██████   ███░░░░░███ ░░███░░░░░███
 ░███░█████░███  ░███    ░███  ░███    ░███  ░███  ░███░█████░███  ███     ░░███ ░███    ░███
 ░███░░███ ░███  ░███████████  ░███████████  ░███  ░███░░███ ░███ ░███      ░███ ░██████████ 
 ░███ ░░░  ░███  ░███░░░░░███  ░███░░░░░███  ░███  ░███ ░░░  ░███ ░███      ░███ ░███░░░░░░  
 ░███      ░███  ░███    ░███  ░███    ░███  ░███  ░███      ░███ ░░███     ███  ░███        
 █████     █████ █████   █████ █████   █████ █████ █████     █████ ░░░███████░   █████       
░░░░░     ░░░░░ ░░░░░   ░░░░░ ░░░░░   ░░░░░ ░░░░░ ░░░░░     ░░░░░    ░░░░░░░    ░░░░░        
                                            
EOF
echo -e "\e[0m"  # Reset text color

# Clone and setup the Oversee repository
echo -e "\e[35m💜 Cloning the Oversee repository...\e[0m"
git clone https://github.com/hydren-dev/Oversee.git

# Navigate into the repository folder
echo -e "\e[35m💜 Navigating into the Oversee directory...\e[0m"
cd Oversee

# Install dependencies
echo -e "\e[35m💜 Installing dependencies...\e[0m"
npm install

# Seed the database
echo -e "\e[35m💜 Seeding the database...\e[0m"
npm run seed

# Create a new user
echo -e "\e[35m💜 Creating a new user...\e[0m"
npm run createUser

# Install Ngrok
echo -e "\e[35m💜 Installing Ngrok...\e[0m"
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
    | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
    && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
    | sudo tee /etc/apt/sources.list.d/ngrok.list \
    && sudo apt update \
    && sudo apt install -y ngrok

# Configure Ngrok with an auth token
echo -e "\e[35m💜 Please enter your Ngrok auth token:\e[0m"
read -p "Auth Token: " the_auth_token
ngrok config add-authtoken $the_auth_token

# Display Ngrok setup success
echo -e "\e[35m💜 Ngrok setup complete! You can use Ngrok to expose your local server.\e[0m"

# Start the application
echo -e "\e[35m💜 Starting the Oversee application...\e[0m"
node .

# Provide instructions for using Ngrok
echo -e "\e[35m💜 To start Ngrok, use the following command:\e[0m"
echo -e "\e[33mngrok http 3000\e[0m"
echo -e "\e[35m💜 Replace '3000' with the port your application is running on if different.\e[0m"

echo -e "\e[35m💜 Setup complete! Enjoy using Oversee. 💜\e[0m"
