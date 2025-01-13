#!/bin/bash

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# ASCII Art
ascii_art="
${CYAN}        
 ██████   ██████   █████████   █████   █████ █████ ██████   ██████    ███████    ███████████ 
░░██████ ██████   ███░░░░░███ ░░███   ░░███ ░░███ ░░██████ ██████   ███░░░░░███ ░░███░░░░░███
 ░███░█████░███  ░███    ░███  ░███    ░███  ░███  ░███░█████░███  ███     ░░███ ░███    ░███
 ░███░░███ ░███  ░███████████  ░███████████  ░███  ░███░░███ ░███ ░███      ░███ ░██████████ 
 ░███ ░░░  ░███  ░███░░░░░███  ░███░░░░░███  ░███  ░███ ░░░  ░███ ░███      ░███ ░███░░░░░░  
 ░███      ░███  ░███    ░███  ░███    ░███  ░███  ░███      ░███ ░░███     ███  ░███        
 █████     █████ █████   █████ █████   █████ █████ █████     █████ ░░░███████░   █████       
░░░░░     ░░░░░ ░░░░░   ░░░░░ ░░░░░   ░░░░░ ░░░░░ ░░░░░     ░░░░░    ░░░░░░░    ░░░░░        
                                                                                                                                                                                  

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

echo_message "💥 Do you want to install Hydra panel (yes/no)? 🤔"
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

# Clone repository, rename, and install
mkdir -p hydra
cd hydra || { echo_message "❌ Failed to create directory"; exit 1; }
git clone https://github.com/hydralabs-beta/panel
cd panel || { echo_message "❌ Failed to change directory to Panel"; exit 1; }
npm install

echo_message "✅ Installed Files ✔️"

echo_message "⚙️ Running Setup... 🌐"

# Run setup scripts
npm run seed
npm run createUser

echo_message "⚡ Starting Hydra... ⚡"

# Start the application using node
node .

echo_message "🎉 Hydra Installed and Started! 🌐"

# Subscription message with emojis
echo -e "${YELLOW}🔔 Subscribe to: ${WHITE}https://youtube.com/@mahimking11 ${CYAN}💻💡${NC}"
