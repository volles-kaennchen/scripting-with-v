## Server unter Ubuntu 22.04 LTS | Skript 2 von 2

# Installation
	sudo apt install pacman
	sudo apt install tldr
	sudo apt install tmux
	sudo apt install terminator
	sudo apt install neofetch

# Sprache der Tastatur ändern
	sudo dpkg-reconfiguration keyboard-configuration
	sudo reboot

# Update, Upgrade 
	sudo apt update
	sudo apt upgrade

	appname --update

# Hostnamen ändern 
	hostnamectl set-hostname vk-server

# SSH Status prüfen
	sudo systemctl status sshd
	vk@vk-host> Status: not installed

# SSH installieren
	sudo apt install openssh-server

# Firewall installieren, wenn nicht vorhanden
	sudo apt install ufw

# Pfad der Firewall ermitteln
	which ufw
	vk@vk-host> /usr/sbin/ufw

# Firewall Status prüfen
	sudo systemctl status ufw
	sudo ufw status numbered
	vk@vk-host> Status: inactive

# Protokolle aktiveren für ssh, http und https
	sudo ufw allow ssh
	vk@vk-host> Rules updated
	vk@vk-host> Rules updated (v6)

	sudo ufw allow http
	vk@vk-host> Rules updated
	vk@vk-host> Rules updated (v6)

	sudo ufw allow https
	vk@vk-host> Rules updated
	vk@vk-host> Rules updated (v6)

# Firewall aktivieren
	sudo ufw enable 
	vk@vk-host> Firewall is active and enabled on system startup

# Ports prüfen
	sudo ufw status numbered
	vk@vk-host> Status: active 
	vk@vk-host> List with active Ports

	sudo systemctl status verbose
	vk@vk-host> Status: active
	vk@vk-host> Loggin: on (low)
	vk@vk-host> Default: deny (incoming), allow (outgoing), disabled (routed)
	vk@vk-host> New Profiles: skip
	vk@vk-host> List with active Ports

# IP Table abrufen
	ip a

# Ports Freigeben
	sudo ufw allow 2222/tcp





terminator
ssh vk@10.50.101.XX 
sudo chage --lastday 0 admin
sudo passwd admin

--------------------------------------
ssh admin@10.50.101.XX

sudo apt update 
sudo apt upgrade

		
sudo killall -u username				
sudo deluser --remove-all-files asapo
(Erst VM Logout danach den Befehl ausfuehren)

cat /etc/ssh 			TAB druecken
ls /lah .ssh
ssh-keygen
ssh-copy-id admin@10.50.101.XX

sudo nano /etc/ssh/sshd_config
>   remove # from Port 2222


ssh admin@10.50.101.XX
sudo cp /etc/ssh/sshd_config sshd_config_backup


