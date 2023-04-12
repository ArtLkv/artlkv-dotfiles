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

## Install Oh-My-Fish
```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf update
omf install sushi
```
Check up is working fine or not.
```bash
omf doctor
```

## Neofetch
```bash 
sudo mkdir ~/.config/neofetch
sudo cp ~/Downloads/dotfiles/.config/neofetch/config.conf ~/.config/neofetch/config.conf
```
