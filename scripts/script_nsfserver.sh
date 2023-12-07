#!/bin/bash
sudo -i
systemctl enable firewalld --now
firewall-cmd --add-service="nfs3" --add-service="rpc-bind" --add-service="mountd" --permanent
firewall-cmd --reload
systemctl enable nfs --now
mkdir -p /srv/share/upload
chown -R nfsnobody:nfsnobody /srv/share
chmod 0777 /srv/share/upload
touch /etc/exports
echo "/srv/share 192.168.50.11(rw,sync,root_squash)" > /etc/exports
exportfs -r
touch /srv/share/upload/check_file