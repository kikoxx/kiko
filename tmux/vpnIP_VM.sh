#!/bin/bash
if pgrep -x openvpn >/dev/null
then 
    # ifconfig tun0 | grep netmask| awk '{print $2}'
    IP=$(ip address show tun0 2>/dev/null | grep 'inet ' | awk '{print $2}' | cut -d '/' -f1)
    
    echo "<xml>"
    echo "  <txt>↻ $IP ↺</txt>"
    echo "</xml>"
else 
	echo "⦿⽘⦿ VPN Iηαcтινe."
fi

# https://1lineart.kulaone.com/