#!/bin/bash

mount="[+] Setting up shared folder to /mnt/hgfs, specifically for vmware..."

# Print the mount message with a slight delay between characters (optional)
for ((i=0; i<${#mount}; i++)); do
    echo -n "${mount:$i:1}"
    sleep 0.05
done
echo

# Check if the entry is already in /etc/fstab
if ! grep -q ".host:/    /mnt/hgfs/" /etc/fstab; then
    sudo sh -c 'echo ".host:/    /mnt/hgfs/    fuse.vmhgfs-fuse    defaults,allow_other,uid=1000     0    0" >> /etc/fstab'
    echo "[+] Entry added to /etc/fstab"
else
    echo "[+] Entry already exists in /etc/fstab"
fi
