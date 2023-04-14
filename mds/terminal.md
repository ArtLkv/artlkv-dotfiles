# My Terminal Setup

## Git configuration
```bash
git config --global user.name "<username>"
git config --global user.email "<email>"

ssh-keygen
cat ~/.ssh/id_rsa.pub # And insert output in SSH/Keys on GitHub
```

## Alacritty
```bash
sudo mkdir ~/.config/alacritty
sudo cp ~/Downloads/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
```

## Install spaceship
```bash
curl -sS https://starship.rs/install.sh | sh
sudo nvim ~/.config/fish/config.fish # And add `starship init fish | source`
```

## Neofetch
```bash 
sudo mkdir ~/.config/neofetch
sudo cp ~/Downloads/dotfiles/.config/neofetch/config.conf ~/.config/neofetch/config.conf
```
