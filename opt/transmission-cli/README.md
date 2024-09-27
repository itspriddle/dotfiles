# transmission-cli

Bash CLI for working Transmission instances.

## Configuration

```
mkdir = ~/.config
jq --null-input \
  --arg url "https://transmission.mydomain.com" \
  '$ARGS.named' > ~/.config/transmission-api.json
chmod 600 ~/.config/transmission-api.json
```

## Installation

```
ln -s "$PWD/bin/"* /usr/local/bin
```
