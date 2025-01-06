#!/bin/bash

# Function to run installation scripts
run_installation() {
    local dir=$1
    local script="$dir/install.sh"
    if [ -f "$script" ]; then
        echo "[+] Running $script..."
        bash "$script"  # Run the script synchronously (blocking)
        if [ $? -ne 0 ]; then  # Check for failure
            echo "[-] $script failed. Exiting."
            exit 1
        fi
    else
        echo "[-] $script not found!"
        exit 1
    fi
}

# Start installations
echo "[+] Starting installations..."

# Run alacritty install
run_installation "alacritty"

# Run tmux install
run_installation "tmux"

# Run vim install
run_installation "vim"

# Run mount install
run_installation "mount"

# Completion message
echo "[+] All installations are complete!"
