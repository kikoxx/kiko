#!/bin/bash

# Function to prompt user to continue or exit
prompt_user() {
    while true; do
        read -p "Do you want to continue with the next installation? (y/n): " choice
        case $choice in
            [Yy]* ) return 0;;  # Continue with the next script
            [Nn]* ) echo "Exiting the installation."; exit 0;;  # Exit if user chooses 'no'
            * ) echo "Please answer with 'y' or 'n': ";;  # Ask again if user enters an invalid response
        esac
    done
}

# Function to run install scripts asynchronously
run_installation() {
    local dir=$1
    local script="$dir/install.sh"
    if [ -f "$script" ]; then
        echo "[+] Running $script..."
        bash "$script" &  # Run the script in the background
    else
        echo "[-] $script not found!"
    fi
}

# Main installation process
echo "[+] Starting installations..."

# Run alacritty install
run_installation "alacritty"
prompt_user

# Run vim install
run_installation "vim"
prompt_user

# Run tmux install
run_installation "tmux"
prompt_user

# Run vim install
run_installation "mount"
prompt_user

# Wait for all background processes to finish
wait

echo "[+] All installations are complete!"
