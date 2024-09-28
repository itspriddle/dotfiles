# speedtest-tracker-cli

Bash CLI for working speedtest-tracker instances.

## Configuration

```
mkdir ~/.config
jq --null-input \
  --arg url "https://prowlarr.mydomain.com" \
  '$ARGS.named' > ~/.config/speedtest-tracker-api.json
chmod 600 ~/.config/speedtest-tracker-api.json
```

## Installation

```
ln -s "$PWD/bin/"* /usr/local/bin
```
