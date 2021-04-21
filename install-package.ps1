#Requires -RunAsAdministrator

## install choco
$chocoCmd = 'choco'
if (Get-Command $chocoCmd -errorAction SilentlyContinue)
{
    "$chocoCmd exists"
} else {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host "You may need to shut down and restart powershell and/or consoles first prior to using choco."
}

## 
Write-Host "Preparing..."

$browsers = "googlechrome", "firefox" # "opera"

$pdfs = "foxitreader", "pdfxchangepro" # "adobereader", "pdfcreator", "cutepdf", "calibre", "wkhtmltopdf"

$utils = "7zip.install", "putty", "sudo",  "sysinternals", "curl", "wget", "procexp", "cpu-z.install", "malwarebytes", "vmwareworkstation"
         # "openssl.light", "jq", "everything", "openssh", "baretail", "lastpass", "dropbox", "filezilla", 

$gnu = "grep", "awk","sed", "findutils" # ,"gnuwin"

$devels = "git.install", "fiddler", "f.lux.install", "poshgit"
         # "git-lfs", "sourcetree", "awscli", "jetbrainstoolbox", "nodejs-lts", "azure-cli", "mysql --version 5.7.18", "redis-64", "graphviz", "postman"

$lang = "python3" # "python2", "pip", "golang", "php --version 7.4.5", "composer"

# $devels_extra = "yarn", "nuget.commandline", "maven", "gradle"

# $messengers = "telegram", "slack"

$editors = "vscode.install", "010editor.install", "ultraedit", "beyondcompare"  # "vim", "hxd", "neovim", "notepadplusplus.install", "sublimetext3", "babelpad", 

foreach($packages in $browsers, $pdfs, $utils, $gnu, $devels, $editors, $messengers, $lang) # $devels_extra $messengers
{
    ## install editor
    Write-Host "Installing $packages"
    foreach($p in $packages) {
        choco install $p -y
    }
}

# 
refreshenv
