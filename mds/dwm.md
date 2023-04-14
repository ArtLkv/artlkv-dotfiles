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
### Xfce

Install XFCE:
```bash
yay -S xfce4 xfce4-goodies
```
https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night
