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

# Check if the .vimrc file exists
if [ ! -f ~/.vimrc ]; then
    echo -e "▶️  ${BLUE}Creating .vimrc file...${RESET}"
    touch ~/.vimrc
fi

# Add vim-plug configuration to .vimrc if not already present
if ! grep -q "call plug#begin" ~/.vimrc; then
    echo -e "▶️  ${BLUE}Adding vim-plug configuration to .vimrc...${RESET}"
    cat << 'EOL' >> ~/.vimrc

set termguicolors
syntax on

call plug#begin('~/.vim/plugged')
Plug 'audibleblink/hackthebox.vim'
call plug#end()

colorscheme hackthebox
EOL
else
    echo -e "✅ ${GREEN}vim-plug configuration already exists in .vimrc.${RESET}"
fi

# Install plugins headlessly
echo -e "\n▶️  ${YELLOW}Installing plugins via vim...${RESET}"
vim -es -u ~/.vimrc +PlugInstall +qall

echo -e "\n${GREEN}${BOLD}✅ Vim setup complete!${RESET}"
echo -e "${CYAN}🏁 Exiting script now...${RESET}\n"
