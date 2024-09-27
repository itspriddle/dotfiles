# pihole-cli

Bash CLI for working Pi-hole instances.

## Configuration

```
mkdir = ~/.config
{ jq --null-input \
      --arg domain "pihole.mydomain.com" \
      --arg url "https://pihole.mydomain.com" \
      --arg key "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" \
      '{ $domain: { $url, $key }'
  jq --null-input \
      --arg domain "pihole2.mydomain.com" \
      --arg url "https://pihole2.mydomain.com" \
      --arg key "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" \
      '{ $domain: { $url, $key }'
} > ~/.config/pihole-api.json
chmod 600 ~/.config/pihole-api.json
```

## Installation

```
ln -s "$PWD/bin/"* /usr/local/bin
```
