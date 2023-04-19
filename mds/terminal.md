# My Terminal Setup

## Git configuration
```bash
git config --global user.name "<username>"
git config --global user.email "<email>"

ssh-keygen
cat ~/.ssh/id_rsa.pub # And insert output in SSH/Keys on GitHub
```

## Powershell(Yes, I use Powershell and Fish)
Install the `pwsh` terminal and configure it.
```bash
yay -S powershell-bin
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
sudo mkdir ~/.config/powershell
sudo cp -r ~/.config/powershell/* ~/.config/powershell
```

Install the PowerShell themes.
```bash
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
```

## Oh-My-Posh
```bash
Install-Module PowerShellGet -AllowClobber -Force
Install-Module -Name PSReadLine -AllowPrerelease
Install-Module -Name Terminal-Icons -Repository PSGallery
```

## Alacritty
```bash
sudo mkdir ~/.config/alacritty
sudo cp ~/Downloads/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
```

## Neofetch
```bash 
sudo mkdir ~/.config/neofetch
sudo cp ~/Downloads/dotfiles/.config/neofetch/config.conf ~/.config/neofetch/config.conf
```
