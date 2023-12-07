#!/bin/bash
sudo -i
systemctl enable firewalld --now 
systemctl status firewalld
mount -o vers=3 192.168.50.10:/srv/share /mnt/
echo "192.168.56.10:/srv/share/ /mnt nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab
touch /mnt/upload/client_file