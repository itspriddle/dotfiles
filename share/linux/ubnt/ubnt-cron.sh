#!/bin/sh

# ^ Ubiquiti stuff runs on BusyBox with the ash shell

# sshpass -padmin ssh admin@10.0.1.98 'if ! grep -q "0.0.0.0 unifi" /etc/hosts; then echo "0.0.0.0 unifi" >> /etc/hosts; fi' > /dev/null

if ! grep -q "0.0.0.0 unifi" /etc/hosts; then
  echo "0.0.0.0 unifi" >> /etc/hosts
fi

if ! grep -q "priddle" /etc/dropbear/authorized_keys; then
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDU4LUwiGf676Ml9ZCmsHzngl6dIoHWO5OZsJ82v8hnj0JJJEXbjMy2qtJ+4VUVPm+BIe+KaYIzxQsYYLEGqqkZ9cgU1jzI14+3PTYkHZF3GKi0fM43XutFGOeWptpk97g6ZzaVOlEbCwdoF3sfBpfySJK4bkGXov8V3RPHbTtrjHYL0K6vyg/Yt/KRbUVyQeSvesNtGtpmmB+3852JsATxCH4RqPhtAe15O/XW9dylLlIATpq2rWfsIFc+5rAIrMuWASRVmfrOGxsjmxW+i3dvw6xDEwFlr+5Qp5V1+EuQYS7LkJqUW/u64B6x/+H65OuOk239kz17l22GITFzmcr4QItjezfvmw6AxfTFTCxj75deDiSy6wlA9pr7D5nCnAeUlZwYXZgC1tbCzKHxvAXMsjSFNzxkljS0v8I7gBuQKVfhE3sgWk6mjH/ZzN/Ayt6ieR9ce5yaYKSi/svgybuVPAzgtdQLDHsc1RVMVpcwFJJfs5Y4FWW03hCbrrrhSOtAZfM+5AEYuJFAQkncVLbyPPdSago5Kwii/n1O9ZTYJh5s1lwy/V9nqOJfFKX6sJgFgLyzoIvya8bwri17uUX8AaeX0eGtrjhenVv9u+DesG58hL9BiV79zl3sxrbVYynr7VkVEGrcz07N+dQyana/ksi1lZJF9a5xwdXP871jeQ== jpriddle@me.com" >> /etc/dropbear/authorized_keys
fi
