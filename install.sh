#!/bin/bash

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

# Run vim install
run_installation "vim"

# Run tmux install
run_installation "tmux"

# Run vim install
run_installation "mount"

# Wait for all background processes to finish
wait

echo "[+] All installations are complete!"
