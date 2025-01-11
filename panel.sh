#!/bin/bash

# ASCII Art
ascii_art="
${CYAN}        
MahimOp
${NC}
"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

echo -e "${CYAN}$ascii_art${NC}"

# Function to display messages with colors
echo_message() {
    echo -e "${MAGENTA}$1${NC}"
}

echo_message "💥 Do you install Skyport panel (yes/no)? 🤔"
read answer

if [ "$answer" != "yes" ]; then
    echo_message "❌ Installation aborted. 💀"
    exit 0
fi

echo_message "⚙️ Installing Dependencies... 🚀"

# Update package list and install dependencies
sudo apt update
sudo apt install -y curl software-properties-common
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - 
sudo apt-get install nodejs -y 
sudo apt install git -y

echo_message "✅ Installed Dependencies ✔️"

echo_message "📂 Installing Files... 📥"

# Create directory, clone repository, and install files
mkdir -p panel5
cd panel5 || { echo_message "❌ Failed to change directory to Skyport"; exit 1; }
git clone https://github.com/achul123/panel5
cd panel5 || { echo_message "❌ Failed to change directory to Panel"; exit 1; }
npm install

echo_message "✅ Installed Files ✔️"

echo_message "🚀 Starting Skyport... 🔥"

# Run setup scripts
npm run seed
npm run createUser

echo_message "⚡ Starting Skyport with PM2... ⚡"

# Install PM2 and start the application
sudo npm install -g pm2
pm2 start index.js

echo_message "🎉 Skyport Installed and Started on Port 3001 🌐"

# Subscribe Message with emojis
echo -e "${YELLOW}🔔 Subscribe to: ${WHITE}https://youtube.com/@mahimking11 ${CYAN}💻💡${NC}"
