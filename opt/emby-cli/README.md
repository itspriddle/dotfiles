# emby-cli

Bash CLI for working with Emby media servers.

## Configuration

```
mkdir ~/.config
jq --null-input \
  --arg api_key "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" \
  --arg api_url "http://emby.local:8096" \
  '$ARGS.named' > ~/.config/emby-api.json
```

## Installation

```
ln -s "$PWD/bin/emby" /usr/local/bin
```
