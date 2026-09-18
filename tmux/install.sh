#!/bin/bash

# Define formatting and color variables
BOLD='\033[1m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

echo -e "${YELLOW}${BOLD}⚙️  Setting up tmux configurations...${RESET}\n"

echo -e "▶️  ${BLUE}Downloading requirements...${RESET}"
sudo apt install tmux xclip dconf-cli -y
# Ensure vmtools are installed: sudo apt install open-vm-tools open-vm-tools-desktop

echo -e "\n▶️  ${BLUE}Setting up kikour tmux config...${RESET}"
cp tmux/kikour_tmux.conf ~/.tmux.conf
mkdir -p ~/Scripts
cp tmux/vpnIP_VM.sh ~/Scripts/vpnIP_VM.sh
chmod +x ~/Scripts/vpnIP_VM.sh

echo -e "\n▶️  ${BLUE}Adding tmux plugin manager...${RESET}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo -e "${CYAN}💡 Remember to press Prefix+I inside tmux to install the plugins.${RESET}"

echo -e "\n▶️  ${BLUE}Installing icons in terminal...${RESET}"
cd ~/
git clone https://github.com/sebastiencs/icons-in-terminal.git
cd icons-in-terminal
chmod +x install.sh
./install.sh

echo -e "\n${GREEN}${BOLD}✅ tmux setup done!${RESET}"
echo -e "${GREEN}🏁 Exiting script now...${RESET}"
echo -e "${CYAN}💡 Open a new terminal for the changes to take effect.${RESET}\n"