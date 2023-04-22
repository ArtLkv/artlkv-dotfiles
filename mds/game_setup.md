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

## Install gamemoderun
```bash
yay -S gamemode lib32-gamemode
sudo usermod -a $USER -G gamemode
sudo nvim /etc/securiry/limits.conf # Add @gamemode       -       nice    10
gamemoded -t # Test
```

## Fix laggy screen updates
