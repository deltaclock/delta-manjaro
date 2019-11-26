#!/bin/bash
################ SETUP SCRIPT FOR PENTEST MANJARO ###########
sudo pacman -Syyu
sudo pacman -S yay
yay -S go docker burpsuite virtualbox chromium visual-studio-code-bin python2-pip python-pip discord lsd binwalk qbittorrent vim nmap proxychains-ng

# REDSHIFT ONLY FOR XFCE
# HASHCAT ?
mkdir ~/ctftools
cd ~/ctftools
git clone https://github.com/deltaclock/dirbuster-lists.git
git clone https://github.com/danielmiessler/SecLists.git
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh && mv LinEnum.sh linenum.sh
wget https://gist.githubusercontent.com/deltaclock/ff1d639f2406a14756c57f2399e0ea17/raw/db4aa8d2d3b3d934f820916bfc68def49c013865/sh.perl
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64


python -m pip install --user wfuzz

# SETUP BASH
cd .
echo '[[ -f ~/.config/bash/bash.conf ]] && source ~/.config/bash/bash.conf' >> ~/.bashrc
cp -r bash/ ~/.config/

go get github.com/OJ/gobuster && go install github.com/OJ/gobuster

# VMS
cd ~/Downloads
#wget http://releases.ubuntu.com/19.04/ubuntu-19.04-live-server-amd64.iso
#wget https://cdimage.kali.org/kali-2019.2/kali-linux-xfce-2019.2-amd64.iso
#wget https://az792536.vo.msecnd.net/vms/VMBuild_20180102/VirtualBox/IE11/IE11.Win7.VirtualBox.zip
#wget https://az792536.vo.msecnd.net/vms/VMBuild_20190311/VirtualBox/MSEdge/MSEdge.Win10.VirtualBox.zip
#unzip IE11.Win7.VirtualBox.zip && unzip MSEdge.Win10.VirtualBox.zip
#rm IE11.Win7.VirtualBox.zip MSEdge.Win10.VirtualBox.zip
echo 'Download your ubuntu, kali and win10 vms'
mkdir -p ~/Desktop/vm_shares/{kali,pwn,win7,win10}
