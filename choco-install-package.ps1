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

$browsers = "googlechrome", "firefox", "opera"

$pdfs = "adobereader", "foxitreader", "pdfcreator", "cutepdf", "calibre", "wkhtmltopdf"

$utils = "7zip", "openssh", "putty", "sudo",  "sysinternals", "curl", "wget", "filezilla", "dropbox", "procexp"
        ,"openssl.light", "jq", "everything", "cpu-z.install", "baretail", "lastpass"

$gnu = "grep", "awk","sed", "findutils"  # ,"gnuwin"

$devels = "git", "git-lfs", "poshgit", "sourcetree",  "awscli", "jetbrainstoolbox", "nodejs-lts", "azure-cli",
         "fiddler", "postman", "redis-64", "graphviz", "f.lux", "mysql --version 5.7.18"

$lang = "python --version 3.7.7", "pip", "golang", "php --version 7.4.5", "composer"

$devels_extra = "yarn", "nuget.commandline", "maven", "gradle"

$messengers = "telegram", "slack"

$editors = "vim", "notepadplusplus.install", "hxd", "babelpad", "vscode", "sublimetext3", "beyondcompare"  #"neovim" 

foreach($packages in $browsers, $pdfs, $utils, $gnu, $devels, $devels_extra, $editors, $messengers) 
{
    ## install editor
    Write-Host "Installing $packages"
    foreach($p in $packages) {
        choco install $p -y
    }
}

# 
refreshenv

