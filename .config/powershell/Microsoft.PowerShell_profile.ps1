# Imports
Import-Module -Name PSReadLine
Import-Module -Name Terminal-Icons
# Imports

# Oh-My-Posh
oh-my-posh --init --shell pwsh --config ~/.config/powershell/powershell.json | Invoke-Expression
# Oh-My-Posh

# Settings
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionView ListView
# Settings

# Envs
$env:DOTNET_ROOT="/home/artlkv/.dotnet"
$env:DOTNET_TOOLS="$env:DOTNET_ROOT/tools"
$arrPath = $env:PATH -split ';'
$env:PATH = ($arrPath + $env:DOTNET_ROOT + $env:DOTNET_TOOLS) -join ':'
# Envs

# Functions
function itemsList
{
    Get-ChildItem -Path . -Force
}
# Functions

# Aliases
New-Alias ll itemsList
# Aliases

# Scripts
neofetch
# Scripts
