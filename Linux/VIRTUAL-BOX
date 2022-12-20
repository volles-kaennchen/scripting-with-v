sudo -i
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" > /etc/apt/sources.list.d/virtualbox.list
cat /etc/apt/sources.list.d/virtualbox.list
apt update
apt -y install virtualbox-6.1
~$ sudo adduser $USER vboxusers
