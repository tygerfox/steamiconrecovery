# Steam Icon Recovery
Simple PowerShell script to recover all the official steam game icons for all game shortcuts in directory.

## Purpose
If the shortcuts to one or more of your steam games is missing an icon this script can recover them.
This can happen when you let steam find preinstalled game files.
Steam will then find the game files but not download the icons to C:\Program Files (x86)\Steam\steam\games.

## How to use
Just download the [genicons.ps1](https://raw.githubusercontent.com/tygerfox/steamiconrecovery/main/genicons.ps1) file and place it in the directory with the shortcuts that are missing an icon. (This is probably just you're desktop.)
Then run the script with powershell.
If PowerShell refuses to run the script have a look at [this](https://superuser.com/questions/106360/how-to-enable-execution-of-powershell-scripts) forum post to find out how to unlock unsigned PowerShell scripts.

## How it works
Steam game shortcuts are actually .url files that describe the "URL" that let's steam launch the right game.
This URL contains the unique steam gameid. It also contain a path to the icon file that should be displayed.
If this file doesn't exist, the script can use the gameid and icon file name to download it from https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/[gameid]/[filename].
