## Boot Arch Linux and run Bash

    loadkeys de-latin
    nano /etc/pacman.conf 
--> change Siglevel to = Never

    pacman -Syy
    pacman -S git tmux 
    git clone https...
    cd Archlinux
    git checkout master
    ls -lh
    chmod +x install.sh
    ./install.sh
    reboot
    
## Login as user: root | for pw press ENTER

## Install Arch Linux by cloning an Git Repository

    git clone https://github.com/namedesuser/namedesrepository.git    
    z.B.: https://github.com/volles-kaennchen/scripting-with-v.git

## Install Arch Linux via an specific Git Repository Skript

    pacman -S wget 

    wget https://raw.githubusercontent.com/namedesuser/namedesrepository/namedesbranch/namederdatei  
    z.B.: https://raw.githubusercontent.com/volles-kaennchen/scripting-with-v/master/Linux/install.sh


## Zusatz zu install.sh 
* EOF bedeutet EndOfLife - so viel wie in etwa "hier ist das Skript zuende"
* Leerzeilen im skript bedeutet immer ENTER (nächsten Befehl ausführen)
* set -o errexit - bedeutet dieses Skript soll nicht weiter ausgeführt werden und die Installation abbrechen, sofern Fehler auftreten
* ip route add default - behebt mögliche Internet Probleme
* sleep - z.B.: sleep 3, für 3 Sekunden warten
* mkinitcpio - startet den Kernel neu
* von systemctl - nach systemmd - zum kernel


