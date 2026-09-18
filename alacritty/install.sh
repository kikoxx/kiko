#!/bin/bash

# Define formatting and color variables
BOLD='\033[1m'
GREEN='\033[1;32m'
RED='\033[1;31m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

echo -e "${YELLOW}${BOLD}⚙️  Setting up Alacritty terminal...${RESET}\n"

# Ubuntu / Debian based installation
echo -e "▶️  ${BLUE}Installing Alacritty and npm dependencies...${RESET}"
sudo apt install alacritty npm -y 
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Failed to install alacritty or npm. Exiting.${RESET}"
    exit 1
fi

# Install alacritty-themes manager
echo -e "\n▶️  ${BLUE}Installing alacritty-themes...${RESET}"
sudo npm i -g alacritty-themes -y
if [ $? -ne 0 ]; then 
    echo -e "${RED}❌ Failed to install alacritty-themes. Exiting.${RESET}"
    exit 1
fi

echo -e "\n▶️  ${BLUE}Creating initial Alacritty config file...${RESET}"
alacritty-themes --create
if [ $? -ne 0 ]; then 
    echo -e "${RED}❌ Failed to create alacritty config file. Exiting.${RESET}"
    exit 1
fi

alacritty_config_path="$HOME/.config/alacritty/alacritty.toml"

# Append glassy background, blur, and custom color scheme
echo -e "\n▶️  ${BLUE}Applying glassy transparency, blur, and custom theme to alacritty.toml...${RESET}"
cat << 'EOL' >> "$alacritty_config_path"

# ==========================================
# Glassy Transparency & Blur Customization
# ==========================================
[window]
opacity = 0.85
blur = true
padding = { x = 12, y = 12 }
dynamic_padding = true

# ==========================================
# Color Scheme & Selection
# ==========================================
[colors.primary]
background = "#1a2332"
foreground = "#a4b1cd"

[colors.selection]
text = "#ffffff"
background = "#313f55"

[colors.cursor]
text = '#eee9fc'
cursor = '#eee9fc'

[colors.normal]
black = "#000000"
red = "#ff3e3e"
green = "#9fef00"
yellow = "#ffaf00"
blue = "#5cb2ff"
magenta = "#9f00ff"
cyan = "#2ee7b6"
white = "#ffffff"

[colors.bright]
black = "#666666"
red = "#ff8484"
green = "#c5f467"
yellow = "#ffcc5c"
blue = "#5cb2ff"
magenta = "#c16cfa"
cyan = "#5cecc6"
white = "#ffffff"

[selection]
save_to_clipboard = false
EOL

echo -e "\n${GREEN}${BOLD}✅ Alacritty setup done!${RESET}"
echo -e "${YELLOW}💡 Note: For 'blur = true' to work, ensure your XFCE Window Manager Compositor is enabled:"
echo -e "   Go to Applications > Window Manager Tweaks > Compositor > Check 'Enable display compositing'.${RESET}"
echo -e "${CYAN}🏁 Exiting script now...${RESET}\n"
