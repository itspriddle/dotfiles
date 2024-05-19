#!/bin/sh

# ^ Ubiquiti stuff runs on BusyBox with the ash shell

# I'm running an Ubiquiti AP 6 Pro in standalone mode. It relentlessly
# attempts to connect to `http://unify:8080/inform` to be adopted, even though
# I'm not running an Ubiquiti controller. To avoid it spamming my DNS servers,
# I am blackholing it in `/etc/hosts`.
#
# I also want to be able to use SSH keys. Ubiquiti uses Dropbear and looks for
# keys at `/etc/dropbear/authorized_keys`. That file isn't persisted between
# reboots though.
#
# To solve this, I am using `sshpass` and a cron job (this script) on a
# separate machine.
#
# Set a password file for `sshpass`:
#   mkdir -p ~/.config/
#   echo password > ~/.config/sshpass-wifi1
#
# Setup a cron job with `crontab -e`:
#   0 0 * * * bash -c "cat /home/pi/.dotfiles/share/linux/ubnt/ubnt-cron.sh | sshpass -f /home/pi/.config/sshpass ssh admin@wifi1.priddle.network 'cat | sh'" > /dev/null

if ! grep -q "0.0.0.0 unifi" /etc/hosts; then
  echo "0.0.0.0 unifi unifi.priddle.network" >> /etc/hosts
fi

if ! grep -q "priddle" /etc/dropbear/authorized_keys 2> /dev/null; then
  echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMcw4tI3HvAnl7ojO9+oyfRhMqwDhMSOzRKld2VjrN7E 2024 jpriddle@me.com" >> /etc/dropbear/authorized_keys
fi
