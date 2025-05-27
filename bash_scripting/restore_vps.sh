#!/bin/bash

restore() {
echo -e "\ndd if=/tmp/${back_fn} | bzip2 -d | pv -s ${size_bk}G | dd of=/dev/vgkvm/${kvmid}_img"
}

snap_dd_create() {
echo -e "\nCreate Snapshot and make Dump"
echo "lvcreate -L ${size_bk}GB -s -n ${kvmid}_img_snap /dev/vgkvm/${kvmid}_img"

echo "dd if=/dev/vgkvm/${kvmid}_img_snap | pv -s ${size_bk}G | dd of=/tmp/${kvmid}_img_bak"

echo -e "\nSynchronize with the destination node"
echo "rsync -avP ${kvmid}_img_bak root@${node_ip}:/tmp/ -e 'ssh -p 56777'"

echo -e "\nRemove snapshot LVM"
echo "lvremove /dev/vgkvm/${kvmid}_img_snap"

echo -e "\nStart restore"
echo "dd if=/tmp/${kvmid}_img_bak | pv -s ${size_bk}G | dd of=/dev/vgkvm/${kvmid}_img"
}

echo -e "Choose 1 or 2:\n1 - Restore with existing backup. \n2 - Create Snapshot + dd + rsync"
read -n 1 restore_param

echo -e "\n"

echo "Enter KVM ID:"
read kvmid
echo "Enter Size for backup:"
read size_bk

if (( $restore_param == 1 )); then
    echo "Enter Backup filename:"
    read back_fn
    restore
else (( $restore_param == 2))
    echo "Ender Node IP for synchronization:"
    read node_ip
    snap_dd_create
fi
