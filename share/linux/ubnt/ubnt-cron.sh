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
  echo "0.0.0.0 unifi" >> /etc/hosts
fi

if ! grep -q "priddle" /etc/dropbear/authorized_keys 2> /dev/null; then
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDU4LUwiGf676Ml9ZCmsHzngl6dIoHWO5OZsJ82v8hnj0JJJEXbjMy2qtJ+4VUVPm+BIe+KaYIzxQsYYLEGqqkZ9cgU1jzI14+3PTYkHZF3GKi0fM43XutFGOeWptpk97g6ZzaVOlEbCwdoF3sfBpfySJK4bkGXov8V3RPHbTtrjHYL0K6vyg/Yt/KRbUVyQeSvesNtGtpmmB+3852JsATxCH4RqPhtAe15O/XW9dylLlIATpq2rWfsIFc+5rAIrMuWASRVmfrOGxsjmxW+i3dvw6xDEwFlr+5Qp5V1+EuQYS7LkJqUW/u64B6x/+H65OuOk239kz17l22GITFzmcr4QItjezfvmw6AxfTFTCxj75deDiSy6wlA9pr7D5nCnAeUlZwYXZgC1tbCzKHxvAXMsjSFNzxkljS0v8I7gBuQKVfhE3sgWk6mjH/ZzN/Ayt6ieR9ce5yaYKSi/svgybuVPAzgtdQLDHsc1RVMVpcwFJJfs5Y4FWW03hCbrrrhSOtAZfM+5AEYuJFAQkncVLbyPPdSago5Kwii/n1O9ZTYJh5s1lwy/V9nqOJfFKX6sJgFgLyzoIvya8bwri17uUX8AaeX0eGtrjhenVv9u+DesG58hL9BiV79zl3sxrbVYynr7VkVEGrcz07N+dQyana/ksi1lZJF9a5xwdXP871jeQ== jpriddle@me.com" >> /etc/dropbear/authorized_keys
fi
