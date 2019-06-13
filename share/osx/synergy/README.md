# My Synergy Setup

My setup for running [Synergy][] on macOS. I mainly did it this way so I
didn't have to look at the ugly menubar icon.

[Synergy]: https://symless.com/synergy

## Install

The client machine needs to be able to SSH to the server. I have this all
setup already so it isn't covered here.

### Server

1. Install Synergy
2. Install Synergy server launchd plist:
   `cp xyz.priddle.synergys.plist ~/Library/LaunchAgents/`
3. Edit plist if necessary to make sure file paths are correct
4. Start Synergy server:
   `launchctl load -w ~/Library/LaunchAgents/xyz.priddle.synergys.plist`
5. Stop Synergy server:
   `launchctl unload -w ~/Library/LaunchAgents/xyz.priddle.synergys.plist`

Note: `synergys.conf` is referenced by the server plist but it shouldn't need
to be edited unless you are stealing this from me :smile:

### Client

1. Install Synergy
2. Install Synergy client launchd plist:
   `cp xyz.priddle.synergyc.plist ~/Library/LaunchAgents/`
3. Install SSH tunnel launchd plist (Synergy traffic is piped through this so
   it is secure):
   `cp xyz.priddle.synergyc-ssh-tunnel.plist ~/Library/LaunchAgents/`
4. Edit plists if necessary to make sure file paths and usernames are correct
5. Start SSH tunnel:
   `launchctl load -w ~/Library/LaunchAgents/xyz.priddle.synergyc-ssh-tunnel.plist`
6. Start Synergy client:
   `launchctl load -w ~/Library/LaunchAgents/xyz.priddle.synergyc.plist`
7. Stop SSH tunnel:
   `launchctl unload -w ~/Library/LaunchAgents/xyz.priddle.synergyc-ssh-tunnel.plist`
8. Stop Synergy client:
   `launchctl unload -w ~/Library/LaunchAgents/xyz.priddle.synergyc.plist`

## Uninstall

### Server

1. Stop Synergy server:
   `launchctl unload -w ~/Library/LaunchAgents/xyz.priddle.synergys.plist`
2. Remove plist:
   `rm ~/Library/LaunchAgents/xyz.priddle.synergys.plist`
3. Uninstall Synergy

### Client

1. Stop SSH tunnel:
   `launchctl unload -w ~/Library/LaunchAgents/xyz.priddle.synergyc-ssh-tunnel.plist`
2. Stop Synergy client:
   `launchctl unload -w ~/Library/LaunchAgents/xyz.priddle.synergyc.plist`
3. Remove plists:
   `rm ~/Library/LaunchAgents/xyz.priddle.synergyc{,-ssh-tunnel}.plist`
4. Uninstall Synergy
