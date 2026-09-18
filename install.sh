#!/bin/bash

# Define formatting and color variables
BOLD='\033[1m'
GREEN='\033[1;32m'
RED='\033[1;31m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

# Function to run installation scripts
run_installation() {
    local dir=$1
    local script="$dir/install.sh"
    
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${YELLOW}⚙️  Installing: ${BOLD}${dir}${RESET}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

    if [ -f "$script" ]; then
        echo -e "▶️  Running ${script}...\n"
        bash "$script"  # Run the script synchronously (blocking)
        
        if [ $? -ne 0 ]; then  # Check for failure
            echo -e "\n${RED}❌ Error: ${script} failed. Halting installation.${RESET}\n"
            exit 1
        else
            echo -e "\n${GREEN}✅ ${dir} installed successfully!${RESET}\n"
        fi
    else
        echo -e "\n${RED}⚠️  Error: ${script} not found! Halting installation.${RESET}\n"
        exit 1
    fi
}

clear
echo -e "${GREEN}${BOLD}🚀 System Installations Menu${RESET}\n"
echo -e "  1) Alacritty"
echo -e "  2) Tmux"
echo -e "  3) Vim"
echo -e "  4) Mount"
echo -e "  5) Execute All"
echo -e "  q) Quit"
echo -e ""

read -p "Select an option (e.g., '1 3' for Alacritty & Vim, or '5' for All): " choices

# Check for quit
if [[ "$choices" == *"q"* || "$choices" == *"Q"* ]]; then
    echo -e "\n${CYAN}Exiting...${RESET}\n"
    exit 0
fi

# Determine if we are running everything
run_all=false
if [[ "$choices" == *"5"* || "${choices,,}" == *"all"* ]]; then
    run_all=true
fi

echo -e "\n${GREEN}${BOLD}🚀 Starting Selected Installations...${RESET}\n"

if [ "$run_all" = true ] || [[ "$choices" == *"1"* ]]; then
    run_installation "alacritty"
fi

if [ "$run_all" = true ] || [[ "$choices" == *"2"* ]]; then
    run_installation "tmux"
fi

if [ "$run_all" = true ] || [[ "$choices" == *"3"* ]]; then
    run_installation "vim"
fi

if [ "$run_all" = true ] || [[ "$choices" == *"4"* ]]; then
    run_installation "mount"
fi

echo -e "${GREEN}${BOLD}🎉 Selected installations are complete!${RESET}\n"