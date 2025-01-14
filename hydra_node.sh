#!/bin/bash

# Purple-themed HydraDAEMON Installation Script
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

# Clone the HydraDAEMON repository
echo -e "\e[35m💜 Cloning the HydraDAEMON repository...\e[0m"
git clone https://github.com/hydren-dev/HydraDAEMON

# Navigate into the repository folder
echo -e "\e[35m💜 Navigating into the HydraDAEMON directory...\e[0m"
cd HydraDAEMON

# Install dependencies
echo -e "\e[35m💜 Installing dependencies...\e[0m"
npm install

# Run the user-provided command
echo -e "\e[35m💜 Running the command: node $user_command...\e[0m"
node $user_command

# Start the application
echo -e "\e[35m💜 Starting the HydraDAEMON application...\e[0m"
node .

echo -e "\e[35m💜 Setup complete! Enjoy using HydraDAEMON. 💜\e[0m"
