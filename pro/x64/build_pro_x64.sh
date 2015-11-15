#! /bin/zsh
lb clean
lb config
lb config --archive-areas "main contrib non-free"
lb config --distribution jessie
lb config --debian-installer live
lb config --bootloader syslinux
lb config --binary-images iso-hybrid
lb config --bootappend-live "boot=live config username=user hostname=loxacorp-pro-0.1-live user-fullname=user@loxacorp-pro-0.1-live"
lb config --grub-splash grub_splash.png
lb config --syslinux-splash splash.png
lb config --iso-application "loxacrp 0.1-pr64" --iso-preparer "Loxacorp Inc." --iso-volume "loxacrp 0.1-pr64"
lb config --binary-filesystem fat32
lb config -m http://ftp.br.debian.org/debian/
echo "vim-gtk gnupg2 pv htop powertop iftop iotop gparted gnumeric python python3 file-roller vlc arandr xfce4 aria2 aspell aspell-es aspell-en backintime-gnome bvi ufw gufw clamav clamtk zsh evince curl ghex glances gopher hexcurse bsdmainutils genisoimage meld macchanger binutils p7zip qemu qemu-kvm git subversion gcc gscan2pdf transmission-gtk traceroute xscreensaver xscreensaver-data-extra network-manager network-manager-gnome xinit gnome" > config/package-lists/custom.list.chroot
#cp custom_cmds.sh config/hooks/custom_cmds.hook.chroot # Doesn't work as a hook?
#./custom_cmds.sh
lb build &&
for i in live-image-amd64.*; do
	mv $i loxacorp-pro-0.1-`echo $i | awk -F"-" '{print $3}'` ;
done

