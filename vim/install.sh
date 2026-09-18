#!/bin/bash

# Define formatting and color variables
BOLD='\033[1m'
GREEN='\033[1;32m'
RED='\033[1;31m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

msg="[+] Setting up vim configs..."

for ((i=0; i<${#msg}; i++)); do
    echo -n "${msg:$i:1}"
    sleep 0.05
done
echo

# Install vim-plug
echo -e "▶️  ${BLUE}Downloading vim-plug...${RESET}"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy custom.vim to ~/.vimrc
if [ -f "custom.vim" ]; then
    echo -e "▶️  ${BLUE}Applying custom.vim configuration to ~/.vimrc...${RESET}"
    cp custom.vim ~/.vimrc
else
    echo -e "${RED}❌ Error: custom.vim not found in the vim/ directory!${RESET}"
    exit 1
fi

# Install plugins headlessly (won't freeze the script)
echo -e "\n▶️  ${YELLOW}Installing plugins with vim...${RESET}"
vim -es -u ~/.vimrc +PlugInstall +qall

# Manual fallback instructions
manual="Do it manually if it doesn't work:"
for ((i=0; i<${#manual}; i++)); do
    echo -n "${manual:$i:1}"
    sleep 0.05
done
echo
echo "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
echo "cp custom.vim ~/.vimrc"
echo "vim +PlugInstall +qall"
echo

exit_txt="Exiting script now..."
for ((i=0; i<${#exit_txt}; i++)); do
    echo -n "${exit_txt:$i:1}"
    sleep 0.05
done
echo
