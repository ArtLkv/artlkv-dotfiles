# My application and their configurations

## Install Flatpak and Flatseal
```bash
yay -S flatpak
flatpak install flathub com.github.tchx84.Flatseal
```

## Install Telegram
```bash
flatpak install flathub org.telegram.desktop
sudo flatpak override --env=XCURSOR_SIZE=12 org.telegram.desktop

flatpak --user override --filesystem=/home/$USER/.icons/:ro org.telegram.desktop
flatpak --user override --filesystem=/usr/share/icons/:ro org.telegram.desktop
```

## Install KeePassXC
```bash
flatpak install flathub org.keepassxc.KeePassXC
```

## Install OnlyOffice
```bash
flatpak install flathub org.onlyoffice.desktopeditors
```
