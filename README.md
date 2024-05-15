# dotfiles

Here are my dotfiles, to run the automated setup:

Note: `sudo` is required

```sh
curl -sSL https://github.com/soda3x/dotfiles/raw/master/setup-dotfiles.sh | sudo bash -s <username>
```

or if you want to edit the `.gitconfig`

```sh
curl -sSL https://github.com/soda3x/dotfiles/raw/master/setup-dotfiles.sh | sudo bash -s <username> <gitconfig-name> <gitconfig-email>
```

## Notes
1. For aliases to work, you will need to restart bash
2. You will need to install the Tmux plugins, run `Ctrl+B, I`, remove old plugins with `Ctrl+B, Alt+u`
3. If Tmux doesn't source correctly, run `Ctrl+B, \, r, Esc` to reload `.tmux.conf` (only works after Note 2)
