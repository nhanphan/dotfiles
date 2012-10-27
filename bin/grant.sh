#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <proxied-server>"
  exit 1;
fi

server=$1
remoteUser=ubuntu
identity=~/.ssh/isocket-saas.pem
prodHost=107.23.39.18
user=nhan
homeDir=/home/$user
sshDir=$homeDir/.ssh

ssh -oProxyCommand="ssh  -i $identity ${remoteUser}@${prodHost} -W %h:%p" -i $identity ${remoteUser}@${server} "sudo adduser $user; 
sudo adduser $user admin; 
sudo mkdir $sshDir;
sudo chmod 700 $sshDir;
sudo chmod 600 $sshDir/authorized_keys;
echo \"ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvsS1z7+U5hq/qaAXUe/HY8nOYci2nMFQGJecNdPsa+mjPAKL/szk+W012Rjc5tajF57gWOk7WDoZSjp30JcRD+y/IOAI/5+VLgGKNI/zzSGh0wg825x9GQJ3BaOnS19tH656iyFn4L4ySRIrTqaeYTA2gqCp3V2+SXCavkM6a5dxWR2bZrfs5JFkZEc/qXYJqEjdnRT2ByETGIWECwthddnQaohJBDIWAbKUXFs8Z/sUreAEhrDQtqkM70F3sKvFPBOR+ucSodLWp33xEyimoviOfTQ5VmFa2HrLGbWiGmPEt3Ux1Ur+Q953cAgv//ROyyuCxurg97OY+/eeFPxFYw== nhan@nhan-xps\" | sudo tee -a $sshDir/authorized_keys;
sudo chmod 400 $sshDir/authorized_keys;
sudo chown -R $user $sshDir;
sudo chgrp -R $user $sshDir;
"




