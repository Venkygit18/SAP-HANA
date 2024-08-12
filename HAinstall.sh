#!/bin/bash

sudo mkdir /mnt/hanashare
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/saphanashare.cred" ]; then
    sudo bash -c 'echo "username=saphanashare" >> /etc/smbcredentials/saphanashare.cred'
    sudo bash -c 'echo "password=aNXBXiie63MA2zg5ZXAMD7QyTgLMpqFc3d15/XeJCwWz41oF3+Zi9oo6/JZE/fY4Ro2slpJv+erw+AStJqNgMA==" >> /etc/smbcredentials/saphanashare.cred'
fi
sudo chmod 600 /etc/smbcredentials/saphanashare.cred

sudo bash -c 'echo "//saphanashare.file.core.windows.net/hanashare /mnt/hanashare cifs nofail,credentials=/etc/smbcredentials/saphanashare.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30" >> /etc/fstab'
sudo mount -t cifs //saphanashare.file.core.windows.net/hanashare /mnt/hanashare -o credentials=/etc/smbcredentials/saphanashare.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30

scp -r /mnt/hanashare/HDB_SERVER_LINUX_X86_64 /

cd /mnt/hanashare/HDB_SERVER_LINUX_X86_64

chmod +x hdbinst
chmod +x hdblcm

pkill zypper
pkill zypper

zypper --non-interactive --no-refresh install libgcc_s1 
zypper --non-interactive --no-refresh install libstdc++6 
zypper --non-interactive --no-refresh install libatomic1 
zypper --non-interactive --no-refresh install insserv-compat
zypper --non-interactive --no-refresh install libtool

chmod +x /HDB_SERVER_LINUX_X86_64/instruntime/sdbrun 

#./hdblcm --ignore=check_signature_file

printf "\n1\n\n\n\nHN1\n03\n\n2\n\n\n\n\n\nAbc@12345678\nAbc@12345678\nAbc@12345678\nAbc@12345678\n\n\n\n\nAbc@12345678\nAbc@12345678\n\ny" | ./hdblcm --ignore=check_signature_file
