## Server unter Ubuntu 22.04 LTS | Skript 2 von 2

## Installation
	sudo apt install pacman
	sudo apt install tldr
	sudo apt install tmux
	sudo apt install terminator
	sudo apt install neofetch

## Sprache der Tastatur ändern
	sudo dpkg-reconfiguration keyboard-configuration
	sudo reboot

## Update, Upgrade 
	sudo apt update
	sudo apt upgrade

	appname --update

## Hostnamen ändern 
	hostnamectl set-hostname vk-server

## SSH Status prüfen
	sudo systemctl status sshd
	vk@vk-server> Status: not installed

## SSH installieren
	sudo apt install openssh-server

## Firewall installieren, wenn nicht vorhanden
	sudo apt install ufw

## Pfad der Firewall ermitteln
	which ufw
	vk@vk-server> /usr/sbin/ufw

## Firewall Status prüfen
	sudo systemctl status ufw
	sudo ufw status numbered
	vk@vk-server> Status: inactive

## Protokolle aktiveren für ssh, http und https
	sudo ufw allow ssh
	vk@vk-server> Rules updated
	vk@vk-server> Rules updated (v6)

	sudo ufw allow http
	vk@vk-server> Rules updated
	vk@vk-server> Rules updated (v6)

	sudo ufw allow https
	vk@vk-server> Rules updated
	vk@vk-server> Rules updated (v6)

## Firewall aktivieren
	sudo ufw enable 
	vk@vk-server> Firewall is active and enabled on system startup

## Ports prüfen
	sudo ufw status numbered
	vk@vk-server> Status: active 
	vk@v-server> List with active Ports

	sudo systemctl status verbose
	vk@vk-server> Status: active
	vk@vk-server> Loggin: on (low)
	vk@vk-server> Default: deny (incoming), allow (outgoing), disabled (routed)
	vk@vk-server> New Profiles: skip
	vk@vk-server> List with active Ports

## IP Table abrufen
	ip a

## Ports Freigeben
	sudo ufw allow 2222/tcp

# Anmeldung  
	terminator 
	neofetch
	ssh vk@10.50.101.XX 

## Einstellungen Admin Passwort
	sudo chage --lastday 0 admin sudo passwd admin
	sudo passwd admin

## Admin entfernen und VM remote übernehmen
	Benutzer müssen dafür am Host zuvor abgemeldet sein
	sudo killall -u username sudo deluser --remove-all-files username

# Privaten SSH Key generieren 	
	ls -lah .ssh 
	ssh-keygen 
	ssh-copy-id admin@10.50.101.XX

## Inhalt des SSH Ordners ausgeben lassen
	Befehl eintippen und mit TAB bestätigen, nicht mit ENTER ausführen
	cat /etc/ssh

## SSH Einstellungen vornehmen
	sudo nano /etc/ssh/sshd_config

	Add or Change:
	Port 2222
	PasswordAuthentication no
	PermitRootLogin no
	AddUsers admin
	etc..

## Backup erstellen
	ssh admin@10.50.101.XX sudo cp /etc/ssh/sshd_config sshd_config_backup

## Gruppenarbeit | 2 von 2
	In dieser Übung soll jeweils ein Host und ein Server unter Verwendung von Ubuntu 22.04 LTS erstellt werden.
	Das Ziel dieser Übung ist es eine RL Situation zu simulieren, bei der Server und Host von unterschiedlichen Admins an unterschiedlichen Orten administriert werden sollen.

	Aufgabe 3: Verbinden Sie sich auf Ihren erstellten Server-PC über SSH mit den den Host-PC Ihres Gruppenpartners.
	Aufgabe 4: Übernehmen Sie die Kontrolle über den fremden Host, indem Sie dem Ersteller die Admin Rechte entziehen und den Nutzer sowie alle vorhandenen Daten entfernen.




