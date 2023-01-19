## Boot Arch Linux and run Bash

    loadkeys de-latin1


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

## Install Arch Linux by cloning an Git Repository

    git clone https://github.com/namedesuser/namedesrepository.git
    
    z.B.: https://github.com/volles-kaennchen/scripting-with-v.git

## Install Arch Linux via an specific Git Repository Skript

    wget https://raw.githubusercontent.com/namedesuser/namedesrepository/namedesbranch/namederdatei
    
    z.B.: https://raw.githubusercontent.com/volles-kaennchen/scripting-with-v/master/Linux/install.sh
