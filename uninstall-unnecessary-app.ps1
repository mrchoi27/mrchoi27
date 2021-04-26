## 
Write-Host "Preparing..."

$non_essential_apps = "*onenote*",          # OneNote
                      "*skypeapp*",         # Get Skype
                      "*windowsstore*",     # Windows Store
                      "*soundrecorder*",    # Sound Recorder
                      "*bingnews*",         # News
                      "*windowsalarms*",    # Alarm and Clock
#                      "*windowscalculator*",    # Calculator
                      "*windowscommunicationsapps*",    # Calendar and Mail
                      "*windowscamera*",        # Camera
                      "*zunemusic*",            # Groove Music
                      "*windowsmaps*",          # Maps
                      "*solitairecollection*",  # Microsoft Solitaire Collection
                      "*zunevideo*",        # Movies and TV
                      "*people*",           # People
                      "*windowsphone*",     # Windows Phone
                      "*photos*",           # Photos
                      "*xboxapp*",          # XBOX
                      "*3dbuilder*",        # 3D Builder
                      "*officehub*",        # Get Office
                      "*getstarted*",       # Get Started
                      "*bingfinance*",      # Money
                      "*windowsphone*",     # Phone Companion
                      "*bingsports*",       # Sports
                      "*soundrecorder*",    # Voice Recorder
                      "*bingweather*"       # Weather

foreach ($app in $non_essential_apps)
{
    ## install editor
    Write-Host "Uninstalling $app"
        Get-AppxPackage $app | Remove-AppxPackage
}
