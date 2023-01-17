## Prepare VM

    ISO Arch Linux 
    4096MB | 2 CPU | 40GB Speicher | Grafikspeicher FULL 
    Netzwerkbrücke + allow VM und Host


## Tastatur auf deutsch umstellen 

    loadkeys de-latin1


## Alle Festplatten auflisten

    lsblk

    reflector -c Germany -a 6 --sort rate --save /etc/pacman.d/mirrorlist

    head /etc/pacman.d/mirrorlist  ("head" zeigt die ersten 10 Zeilen an) 

    fdisk /dev/sda 
    ODER
    cfdisk /dev/sda

    choose "gpt" and confirm with enter
    sda1  300MB   Type: EFI
    sda2  2.0GB   Type: Linux Swap
    sda3  30GB    Type: Linux Filesystem
    sda4  9.0GB   Type: Linux Filesystem
    choose "write", confirm by enter: yes
    quit


## Partitionen überprüfen

    lsblk 


## Partitionen formatieren

    mkfs.fat -F32 /dev/sda1
    mkswap /dev /sda2
    mkfs.ext4 /dev/sda3
    mkfs.ext4 /dev/sda4


## Verzeichnisse erstellen, platzieren, verschieben

    mount /dev/sda3 /mnt
    mkdir -p /mnt/{boot/efi,home}
    mount /dev/sda1 /mnt/boot/efi
    mount /dev/sda4 /mnt/home


## Partitionen erneut überprüfen (Mountpoints sollten nun hinterlegt sein)

    lsblk 


## Installation (grundlegende Dinge)

    pacstrap /mnt base base-devel linux linux-firmware nano git intel-ucode grub efibootmgr virtualbox-guest-utils lxde


## Config- Files

    nano /etc/pacman.conf

    > look for "SigLevel = Object...", remove text after = and replace with the word: Never
    > save settings with strg + o + ENTER + X


## Filesys-table generieren

    genfstab -U /mnt >> /mnt/etc/fstab


## Absprung vom Root Livemedium in das installierte Root System

    arch-chroot /mnt 

    > Login should be: [root@archiso /]


## Zeitzone festlegen

    ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime


## Zeit aktualisieren

    hwclock --systohc


## Zeit überprüfen

    date


## Config- Files

    nano /etc/locale.gen

    > look for "de_DE.UTF-8 UTF-8", remove #
    > save settings with strg + o + ENTER + X

    locale-gen 
    
    
    nano etc/locale.com

    > Add: LANG=de_DE.UTF-8
    > save settings with strg + o + ENTER + X

    nano etc/hostname

    > Add root name
    > save settings with strg + o + ENTER + X

    nano etc/hosts

    > Add: 
    > 127.0.0.1     TAB drücken     localhost
    > ::1           TAB drücken     localhost
    > 127.0.1.1     TAB drücken     rootname-einfügen.local domain  TAB drücken rootname-einfügen

    nano /etc/pacman.conf

    > look for "SigLevel = Object...", remove text after = and replace with the word: Never
    > save settings with strg + o + ENTER + X


## Complete Set-Up

    pacman -S sudo networkmanager network-manager-applet wpa_supplicant dialog mtools dosfstools linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils alsa-utils pipewire pipewire-alsa pipewire-jack openssh rsync bridge-utils dnsmasq ufw


## Benutzer und Gruppen

    nano /etc/sudoers

    > look for "%wheel ALL=(ALL:ALL) ALL", remove #
    > save settings with strg + o + ENTER + X


## Passwörter aktualisieren

    passwd


## EFI aktivieren
  
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

    grub-mkconfig -o /boot/grub/grub.cfg


## Dienste starten

    systemctl enable NetworkManager
    systemctl enable sshd
    systemctl enable avahi.daemon
    systemctl enable reflector.timer
    systemctl enable ufw 
    systemctl enable lxdm
    systemctl enable vboxservice


## System verlassen und neu starten

    umount -a
    exit
    reboot oder poweroff


## if "sh: can't access tty; job control turned off"

   > boot > loadkeys de-latin1 > repeat mount 3x > nano /boot/initramfs-linux.img UND /boot/initramfs-linux-fallback.img > nanoarch-chroot /mnt > pacman -S linux
