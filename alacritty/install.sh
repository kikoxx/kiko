#!/bin/bash

alacritty="[+] Downloading alacritty..."

for ((i=0; i<${#alacritty}; i++)); do
    echo -n "${alacritty:$i:1}"
    sleep 0.05
done
echo # Prints empty line

# Ubuntu / Debian based; Might include exception handling for other OS
sudo apt install alacritty npm -y 

# https://www.funkyspacemonkey.com/how-to-easily-apply-and-change-alacritty-themes
sudo npm i -g alacritty-themes -y
if [ $? -ne 0 ]; then # Check exit code if it's 0 
    echo "Failed to install alacritty-themes. Exiting."
    exit 1
fi

echo
# The alacritty.toml config file was created here /home/kali/.config/alacritty/alacritty.toml
alacritty-themes --create
if [ $? -ne 0 ]; then # Check exit code if it's 0 
    echo "Failed to create alacritty config file. Exiting."
    exit 1
fi

alacritty_config_path="$HOME/.config/alacritty/alacritty.toml"
# https://github.com/audibleblink/hackthebox.vim?tab=readme-ov-file

cat <<EOL >> "$alacritty_config_path" # <<EOL EOL is a delimiter, << start here document, ends when it sees the delimiter
# alacritty.toml

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
EOL


exit_txt="Exiting script now..."
for ((i=0; i<${#exit_txt}; i++)); do
    echo -n "${exit_txt:$i:1}"
    sleep 0.05
done
echo