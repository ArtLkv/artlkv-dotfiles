# Desktop Window Manager

## Install X.ORG server
```bash
yay -S xorg-server xorg-xinit
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

### i3

- clash - tunnel
- glava, cala - audio vizualizer
- conky - system monitor
- dunst - notification system
- polybar - status bar
- feh - image viewer and wallpaper changer
- rofi - window switcher
- ncmpcpp, playerctl - mpd client

Install i3-wm.
```bash
yay -S i3-wm i3blocks i3lock
yay -S alacritty dmenu
echo 'exec i3' >> ~/.xinitrc
startx
# yay -S numlockx rofi dmenu
```

