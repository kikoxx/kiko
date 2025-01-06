#!/bin/bash

# Function to run install scripts
run_installation() {
    local dir=$1
    local script="$dir/install.sh"
    if [ -f "$script" ]; then
        echo "[+] Running $script..."
        bash "$script" &
        return $!  # Return the PID of the background process
    else
        echo "[-] $script not found!"
        return 1  # Indicate failure
    fi
}

# Main installation process
echo "[+] Starting installations..."

# Run installations in parallel
declare -a pids
run_installation "alacritty" && pids+=($!)
run_installation "vim" && pids+=($!)
run_installation "tmux" && pids+=($!)
run_installation "mount" && pids+=($!)

# Wait for all processes and check their status
for pid in "${pids[@]}"; do
    if ! wait $pid; then
        echo "[-] A background installation failed. Check logs for details."
        exit 1
    fi
done

echo "[+] All installations are complete!"
