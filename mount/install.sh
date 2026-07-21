#!/bin/bash

mount="[+] Setting up shared folder to /mnt/hgfs, specifically for vmware..."

# Print the mount message with a slight delay between characters (optional)
for ((i=0; i<${#mount}; i++)); do
    echo -n "${mount:$i:1}"
    sleep 0.05
done
echo

# Target string to check in /etc/fstab (cleaned up string)
FSTAB_LINE=".host:/ /mnt/hgfs fuse.vmhgfs-fuse defaults,allow_other,nofail,x-systemd.automount,uid=1000 0 0"

# Check if the entry is already in /etc/fstab
if ! grep -q "\.host:/" /etc/fstab; then
    sudo sh -c "echo '$FSTAB_LINE' >> /etc/fstab"
    echo "[+] Entry added to /etc/fstab"
    
    # Reload and trigger the systemd automount immediately
    sudo systemctl daemon-reload
    sudo systemctl restart mnt-hgfs.automount
    echo "[+] Systemd daemon reloaded and automount restarted"
else
    echo "[+] Entry already exists in /etc/fstab"
fi
