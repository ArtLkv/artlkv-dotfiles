# Desktop Window Manager

## Install X.ORG server
```bash
yay -S xorg-server xorg-xinit
```

## Install some usefull apps.
```bash
yay -S firefox alacritty
```
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
