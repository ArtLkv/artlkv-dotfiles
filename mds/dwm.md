# Desktop Window Manager

## Install X.ORG server
```bash
yay -S xorg-server xorg-xinit xorg-apps
```

## Install the browser and terminal app
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

### i3

Install i3-wm.
```bash
yay -S i3-wm i3status i3blocks i3lock
yay -S numlockx rofi dmenu
```

Install display manager.
```bash
yay -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
sudo systemctl start lightdm
```

