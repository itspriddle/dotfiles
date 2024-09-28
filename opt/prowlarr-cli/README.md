# prowlarr-cli

Bash CLI for working Prowlarr instances.

## Configuration

```
mkdir ~/.config
jq --null-input \
  --arg key "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" \
  --arg url "https://prowlarr.mydomain.com" \
  '$ARGS.named' > ~/.config/prowlarr-api.json
chmod 600 ~/.config/prowlarr-api-api.json
```

## Installation

```
ln -s "$PWD/bin/"* /usr/local/bin
```
