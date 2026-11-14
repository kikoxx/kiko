# Add this in ~/.zshrc
# Target IP Management
function setip() { 
    echo "$1" > /tmp/target
    echo "🎯 Target set to $1"
    export IP="$1"
}

# Automatically sync variables across all tabs
autoload -Uz add-zsh-hook
function _sync_vars() {
    # Sync Target IP ($IP)
    if [ -f /tmp/target ]; then
        export IP="$(cat /tmp/target 2>/dev/null)"
    fi
    
    # Sync VPN IP ($PI) from your script
    if [ -f ~/Scripts/vpnIP_VM.sh ]; then
    export PI="$(~/Scripts/vpnIP_VM.sh | grep -oP '(?<=<txt>↻ )[0-9.]+(?= ↺)')"
fi
}
add-zsh-hook precmd _sync_vars