#!/bin/bash
if pgrep -x openvpn >/dev/null; then
    IP=$(ip -4 address show tun0 2>/dev/null | awk '/inet /{print $2}' | cut -d/ -f1 | head -n1)

    if [ -n "$IP" ]; then
        echo "<txt>↻ $IP ↺</txt>"
        echo "<txtclick>sh -c 'printf %s \"$IP\" | xclip -selection clipboard'</txtclick>"
        echo "<tool>Click to copy VPN IP: $IP</tool>"
    else
        echo "<txt>↻ connecting... ↺</txt>"
    fi
else
    echo "<txt>⦿⽘⦿ VPN Inactive</txt>"
fi


# https://1lineart.kulaone.com/