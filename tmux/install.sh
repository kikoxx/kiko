#!/bin/bash

requirements="[+] Downloading requirements..."

for ((i=0; i<${#requirements}; i++)); do
    echo -n "${requirements:$i:1}"
    sleep 0.05
done

sudo apt -E install tmux xclip dconf-cli -y

setup="[+] Setting up kikour tmux config..."
for ((i=0; i<${#setup}; i++)); do
    echo -n "${setup:$i:1}"
    sleep 0.05
done
echo

cp kikour_tmux.conf ~/.tmux.conf
mkdir -p ~/Scripts
cp vpnIP_VM.sh ~/Scripts/vpnIP_VM.sh
chmod +x ~/Scripts/vpnIP_VM.sh

tmux_plugin="Adding tmux plugin manager..."
for ((i=0; i<${#tmux_plugin}; i++)); do
    echo -n "${tmux_plugin:$i:1}"
    sleep 0.05
done
echo

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Press Prefix+I inside tmux to install the plugins"

icons_install="[+] Installing icons in terminal..."
for ((i=0; i<${#icons_install}; i++)); do
    echo -n "${icons_install:$i:1}"
    sleep 0.05
done
echo

cd ~/ ; git clone https://github.com/sebastiencs/icons-in-terminal.git
cd icons-in-terminal;chmod +x install.sh
./install.sh

setup_done="[-] Done!"
for ((i=0; i<${#setup_done}; i++)); do
    echo -n "${setup_done:$i:1}"
    sleep 0.05
done
echo

exit_txt="Exiting script now..."
for ((i=0; i<${#exit_txt}; i++)); do
    echo -n "${exit_txt:$i:1}"
    sleep 0.05
done
echo

echo "Open new terminal for the change."
