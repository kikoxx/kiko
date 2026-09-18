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

# Create Vim's native color directory
echo -e "▶️  ${BLUE}Creating native color directories...${RESET}"
mkdir -p ~/.vim/colors

# Download the HackTheBox theme file directly into the colors folder
echo -e "▶️  ${BLUE}Downloading HackTheBox theme...${RESET}"
curl -fLo ~/.vim/colors/hackthebox.vim https://raw.githubusercontent.com/audibleblink/hackthebox.vim/master/colors/hackthebox.vim

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Failed to download theme file. Exiting.${RESET}"
    exit 1
fi

# Write a clean, working .vimrc with transparency integration
echo -e "▶️  ${BLUE}Configuring ~/.vimrc...${RESET}"
cat << 'EOF' > ~/.vimrc
set termguicolors
syntax on
set background=dark
colorscheme hackthebox

" Make Vim background transparent to match Alacritty's opacity & blur
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
EOF

echo -e "\n${GREEN}${BOLD}✅ Vim setup complete!${RESET}"
echo -e "${CYAN}🏁 Exiting script now...${RESET}\n"
