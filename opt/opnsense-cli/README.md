# opnsense-cli

Bash CLI for working OPNsense firewalls.

## Configuration

```
mkdir ~/.config
jq --null-input \
  --arg key "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" \
  --arg secret "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" \
  --arg url "https://opnsense.mydomain.com" \
  '$ARGS.named' > ~/.config/opnsense-api.json
chmod 600 ~/.config/opnsense-api.json
```

## Installation

```
ln -s "$PWD/bin/"* /usr/local/bin
```
