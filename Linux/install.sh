#!/bin/bash
# Install: bash <(curl -L http://172.30.120.63:8080/install.sh)

set -o errexit

DISK=/dev/sda

loadkeys de
timedatectl set-ntp true
umount /mnt/boot/efi || :
umount /mnt || :
swapoff --all
sleep 2
if [ -e /sys/firmware/efi ]; then
    fdisk "${DISK}" <<EOF
g
n


+300M
y
t

1
n


+512M
y
t

swap
n



y
w
EOF
    mkfs.fat -F 32 "${DISK}1"
    mkswap "${DISK}2"
    swapon "${DISK}2"
    mkfs.ext4 "${DISK}3" <<<"y"
    mount "${DISK}3" /mnt
    mount --mkdir "${DISK}1" /mnt/boot/efi
else
    fdisk "${DISK}" <<EOF
o
n
p


+512M
y
t

82
n
p



y
w
EOF
    mkswap "${DISK}1"
    swapon "${DISK}1"
    mkfs.ext4 "${DISK}2" <<<"y"
    mount "${DISK}2" /mnt
fi
pacstrap /mnt base linux linux-firmware grub efibootmgr lxde virtualbox-guest-utils
genfstab -U /mnt >>/mnt/etc/fstab
ln -sf /run/systemd/resolve/stub-resolv.conf /mnt/etc/resolv.conf
ln -sf /usr/share/zoneinfo/Europe/Berlin /mnt/etc/localtime
echo 'de_DE.UTF-8 UTF-8' >>/mnt/etc/locale.gen
echo 'en_US.UTF-8 UTF-8' >>/mnt/etc/locale.gen
echo 'LANG=de_DE.UTF-8' >>/mnt/etc/locale.conf
echo 'KEYMAP=de' >>/mnt/etc/vconsole.conf
echo 'vm' >>/mnt/etc/hostname
cat >/mnt/etc/X11/xorg.conf.d/00-keyboard.conf <<EOF
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "de"
EndSection
EOF
cat >/mnt/etc/systemd/network/20-wired.network <<EOF
[Match]
Name=en*

[Network]
DHCP=yes
EOF
cat >/mnt/install.sh <<EOF
#!/bin/bash
set -o errexit

hwclock --systohc
locale-gen
mkinitcpio -P
if [ -e /sys/firmware/efi ]; then
    grub-install
else
    grub-install "${DISK}"
fi
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable lxdm
systemctl enable vboxservice
passwd -d root
EOF
chmod +x /mnt/install.sh
arch-chroot /mnt /install.sh
rm /mnt/install.sh
echo FINISHED
