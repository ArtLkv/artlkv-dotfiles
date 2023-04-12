# Desktop Window Manager

## Install X.ORG server
```bash
yay -S xorg-server xorg-xinit
```

## Install some usefull apps.
```bash
yay -S firefox alacritty
```

## Cascade Window Manager

If you want use Xfce, Cinnamon, Mate and others Cascade Window Managers. `Google it`.

### Gnome
```bash
yay -S gnome
sudo nvim /etc/gdm/custom.conf # And uncomment WaylandEnable=false
sudo systemctl enable gdm.service
sudo systemctl start gdm.service
```

### KDE
```bash
yay -S plasma kde-applications
sudo systemctl enable sddm.service
sudo systemctl start sddm.service
```

## Tiling Window Manager

### awesome
Install required dependencies.
```bash
yay -S awesome-git xdg-utils xclip
yay -S pulsemixer playerctl # For controlling system volume and media player
yay -S feh flameshot rofi picom ranger

mkdir ~/.config/awesome
sudo cp -r ~/Downloads/dotfiles/.config/awesome/* ~/.config/awesome/
sudo cp ~/Downloads/dotfiles/.xinitrc ~/.xinitrc
```
