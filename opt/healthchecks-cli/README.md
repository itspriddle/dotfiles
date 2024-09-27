# healthchecks

Bash CLI for working with <https://healthchecks.io>.

## Configuration

```
mkdir = ~/.config
jq --null-input \
  --arg ping_key "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" \
  --arg api_url "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" \
  '$ARGS.named' > ~/.config/healthchecks-io.json
```

## Installation

```
ln -s "$PWD/bin/healthchecks" /usr/local/bin
```
