#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

restore() {
echo -e "\ndd if=/tmp/${back_fn} | bzip2 -d | pv -s ${size_bk}G | dd of=/dev/vgkvm/${kvmid}_img"

}

snap_dd_create() {
echo -e "\n${bold}Create Snapshot and make Dump${normal}"
echo "lvcreate -L ${size_bk}GB -s -n ${kvmid}_img_snap /dev/vgkvm/${kvmid}_img"

echo "dd if=/dev/vgkvm/${kvmid}_img_snap | pv -s ${size_bk}G | dd of=/tmp/${kvmid}_img_bak"

echo -e "\n${bold}Synchronize to the destination node${normal}"
echo "rsync -avP ${kvmid}_img_bak root@${node_ip}:/tmp/ -e 'ssh -p 56777'"

echo -e "\n${bold}Remove snapshot LVM${normal}"
echo "lvremove /dev/vgkvm/${kvmid}_img_snap"

echo -e "\n${bold}Start restore${normal}"
echo "dd if=/tmp/${kvmid}_img_bak | pv -s ${size_bk}G | dd of=/dev/vgkvm/${kvmid}_img"
}

echo -e "Choose ${bold}1${normal} or ${bold}2${normal}:\n1 - Restore with existing backup. \n2 - Create Snapshot + dd + rsync"
read -n 1 restore_param

echo -e "\n"

echo "Enter ${bold}KVM ID${normal}:"
read kvmid
echo "Enter ${bold}Size${normal} for backup:"
read size_bk

if (( $restore_param == 1 )); then
    echo "Enter ${bold}Backup${normal} filename:"
    read back_fn
    restore
else (( $restore_param == 2))
    echo "Ender ${bold}Node IP${normal} for synchronization:"
    read node_ip
    snap_dd_create
fi
