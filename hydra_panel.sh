#!/bin/bash

# Purple-themed Hydra Panel Installation Script
# Made with 💜 by [Your Name]

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

# Update the package list
echo -e "\e[35m💜 Updating package list...\e[0m"
sudo apt update

# Install Node.js and Git
echo -e "\e[35m💜 Installing Node.js and Git...\e[0m"
sudo apt install -y nodejs git

# Clone the Hydra Panel repository
echo -e "\e[35m💜 Cloning Hydra Panel repository...\e[0m"
git clone https://github.com/hydralabs-beta/panel

# Rename the cloned folder to 'hydra'
echo -e "\e[35m💜 Renaming 'panel' to 'hydra'...\e[0m"
mv panel hydra

# Navigate into the 'hydra' directory
echo -e "\e[35m💜 Navigating into the 'hydra' directory...\e[0m"
cd hydra

# Install dependencies
echo -e "\e[35m💜 Installing dependencies...\e[0m"
npm install

# Seed the database
echo -e "\e[35m💜 Seeding the database...\e[0m"
npm run seed

# Create a new user
echo -e "\e[35m💜 Creating a new user...\e[0m"
npm run createUser

# Start the application
echo -e "\e[35m💜 Starting the Hydra Panel...\e[0m"
node .

echo -e "\e[35m💜 Installation and setup complete! Enjoy your Hydra Panel. 💜\e[0m"
