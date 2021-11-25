# Zgenom Extension for creating plugins inline

Big thanks to [zoritle](https://github.com/zoritle) for the idea and [initial
implementation](https://github.com/jandamm/zgenom/issues/84#issuecomment-966037290).

- Add plugin configuration right next to loading the plugins.
- Generate plugins by evaluating commands (e.g. zoxide init script) and have a
  faster startup time

You need to use it with [zgenom](https://github.com/jandamm/zgenom).

## Example

```zsh
source "${HOME}/.zgenom/zgenom.zsh"

zgenom autoupdate --background

if ! zgenom saved; then
    zgenom load jandamm/zgenom-ext-eval

    # Create a plugin which greats the world and name the plugin 'welcome'
    zgenom eval --name welcome echo hello world

    # Load zsh history search and create bindings for it
    zgenom load zsh-users/zsh-history-substring-search
    zgenom eval <<EOF
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    EOF

    # Create an zoxide initialization file
    zgenom eval --name zoxide <<(zoxide init zsh)

    zgenom save
fi
```

**Note:** Since this does not clone a git repository the script is not updated
when `zgenom update` is executed. It is updated when a new shell is started
where `init.zsh` is missing. This shouldn't be an issue using
`zgenom autoupdate --background`.

## Options

- `--name`: name the plugin. If not provided a hash is used instead.
