# Arch setup for gaming

## Steam

```bash
flatpak install flathub com.valvesoftware.Steam
```

Enable `Steam Play` and enable `Steam Cache Shaders`.

Also use this standard command(you can modify it) for all games.

```bash
gamemoderun %command%
```
## Install other tools

### Install Zen Kernel
```bash
yay -S linux-zen linux-zen-headers
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Install wine
```bash
yay -S wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs
yay -S vkd3d lib32-vkd3d faudio lib32-faudio
```
### Install VkBasalt
```bash
yay -S vkbasalt lib32-vkbasalt
```

### Install gamemoderun
```bash
yay -S gamemode lib32-gamemode
sudo usermod -a $USER -G gamemode
sudo nvim /etc/securiry/limits.conf # Add @gamemode       -       nice    10
gamemoded -t # Test
```

### Install mangohud
```bash
yay -S mangohud lib32-mangohud
```
### Install PortProton
```bash
yay -Syu bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver vulkan-icd-loader lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader lib32-gamemode lib32-openssl
wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0
```

## Games start arguments
* Apex Legends: `PROTON_EAC_RUNTIME=1 DXVK_ASYNC=1 ENABLE_VKBASALT=1 WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_STRENGTH=0 gamemoderun %command% -novid -high +fps_max 144`
