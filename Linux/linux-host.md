## Host unter Ubuntu 22.04 LTS | Skript 1 von 2

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
	hostnamectl set-hostname vk-host

## SSH Status prüfen
	sudo systemctl status sshd
	vk@vk-host> Status: not installed

## SSH installieren
	sudo apt install openssh-server

## Firewall installieren, wenn nicht vorhanden
	sudo apt install ufw

## Pfad der Firewall ermitteln
	which ufw
	vk@vk-host> /usr/sbin/ufw

## Firewall Status prüfen
	sudo systemctl status ufw
	sudo ufw status numbered
	vk@vk-host> Status: inactive

## Protokolle aktiveren für ssh, http und https
	sudo ufw allow ssh
	vk@vk-host> Rules updated
	vk@vk-host> Rules updated (v6)

	sudo ufw allow http
	vk@vk-host> Rules updated
	vk@vk-host> Rules updated (v6)

	sudo ufw allow https
	vk@vk-host> Rules updated
	vk@vk-host> Rules updated (v6)

## Firewall aktivieren
	sudo ufw enable 
	vk@vk-host> Firewall is active and enabled on system startup

## Ports prüfen
	sudo ufw status numbered
	vk@vk-host> Status: active 
	vk@vk-host> List with active Ports

	sudo systemctl status verbose
	vk@vk-host> Status: active
	vk@vk-host> Loggin: on (low)
	vk@vk-host> Default: deny (incoming), allow (outgoing), disabled (routed)
	vk@vk-host> New Profiles: skip
	vk@vk-host> List with active Ports

## IP Table abrufen
	ip a

## Ports Freigeben
	sudo ufw allow 2222/tcp

## SSH Verbindung herstellen
	terminator
	neofetch
	ssh vk@10.50.101.XX
		
## Dateien uebertragen (von Pfad - nach Pfad!)
	scp /home/vk/Downloads/Document vk 10.50.101.XX:/home/vk/

## Welcher Benutzer ist gerade angemeldet?
	sudo whoami
		
## Benutzer erstellen
	adduser admin
	sudo !!

## Benutzer der -Sudo Gruppe- hinzufügen
	sudo usermod -aG sudo admin

## Benutzer in aktiver Session wechseln
	su - admin

## Richtlinien aktualisieren
	sudo apt update
	sudo apt upgrade

## Neustart (Änderungen ausführen) 
	sudo reboot 	

## Gruppenarbeit
## In dieser Übung soll jeweils ein Host und ein Server unter Verwendung von Ubuntu 22.04 LTS erstellt werden.
## Ziel dieser Übung ist es eine RL Situation zu simulieren, bei der Server und Host von unterschiedlichen Admins an unterschiedlichen Orten administriert werden sollen.

# Aufgabe 1: Fügen Sie nach erfolgreicher Konfiguration des Host-PC einen weiteren Sudo Admin hinzu.
# Aufgabe 2: Tauschen Sie mit Ihren Gruppenpartner die IP Adresse Ihres erstellten Host-PC aus.
# Aufgabe 3: Verbinden Sie sich auf Ihren erstellten Server-PC über SSH mit den den Host-PC Ihres Gruppenpartners.
# Aufgabe 4: Übernehmen Sie die Kontrolle über den fremden Host, indem Sie dem Ersteller die Admin Rechte entziehen und den Nutzer sowie alle vorhandenen Daten entfernen.

