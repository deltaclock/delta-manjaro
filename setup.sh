#!/bin/bash
# SETUP SCRIPT FOR PENTEST MANJARO
sudo pacman -Syyu
sudo pacman -S yay
yay -S go docker burpsuite virtualbox chromium visual-studio-code-bin python2-pip python-pip discord lsd binwalk

# REDSHIFT ONLY FOR XFCE
# HASHCAT ?
mkdir ~/ctftools
cd ~/ctftools
git clone https://github.com/deltaclock/dirbuster-lists.git
git clone https://github.com/danielmiessler/SecLists.git
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh && mv LinEnum.sh linenum.sh
wget https://gist.githubusercontent.com/deltaclock/ff1d639f2406a14756c57f2399e0ea17/raw/db4aa8d2d3b3d934f820916bfc68def49c013865/sh.perl

python -m pip install --user wfuzz

# SETUP BASH
echo '[[ -f ~/.config/bash/bash.conf ]] && source ~/.config/bash/bash.conf' >> .bashrc
cp -r bash/ ~/.config/

go get github.com/OJ/gobuster && go install github.com/OJ/gobuster