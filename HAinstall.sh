#!/bin/bash

sudo mkdir /mnt/hanashare
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/fuseshare25.cred" ]; then
    sudo bash -c 'echo "username=fuseshare25" >> /etc/smbcredentials/fuseshare25.cred'
    sudo bash -c 'echo "password=E5y36dFvqYToy2hwXd2L6T9lzVjNalpYG/1YQKtgxWMFFIrimcttKbtDtCbtxNBOoBP2sk5qQxO++AStCj8//A==" >> /etc/smbcredentials/fuseshare25.cred'
fi
sudo chmod 600 /etc/smbcredentials/fuseshare25.cred

sudo bash -c 'echo "//fuseshare25.file.core.windows.net/hanashare /mnt/hanashare cifs nofail,credentials=/etc/smbcredentials/fuseshare25.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30" >> /etc/fstab'
sudo mount -t cifs //fuseshare25.file.core.windows.net/hanashare /mnt/hanashare -o credentials=/etc/smbcredentials/fuseshare25.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30

scp -r /mnt/hanashare/HDB_SERVER_LINUX_X86_64 /

cd /mnt/hanashare/HDB_SERVER_LINUX_X86_64

chmod +x hdbinst
chmod +x hdblcm


zypper --non-interactive --no-refresh install libgcc_s1 libstdc++6 libatomic1 insserv-compat libtool

chmod +x /HDB_SERVER_LINUX_X86_64/instruntime/sdbrun 

./hdblcm --ignore=check_signature_file

printf "\n1\n\n\n\nHN1\n03\n\n2\n\n\n\n\n\nAbc@12345678\nAbc@12345678\nAbc@12345678\nAbc@12345678\n\n\n\n\nAbc@12345678\nAbc@12345678\n\ny" | ./hdblcm --ignore=check_signature_file



