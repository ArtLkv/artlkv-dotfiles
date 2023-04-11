# Desktop Window Manager

## Cascade Window Manager

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

If you want use Xfce, Cinnamon, Mate and others Cascade Window Managers. `Google it`.

## Tiling Window Manager

### i3
- i3-wm
- polybar
- conky

Install i3-wm.
```bash

```

