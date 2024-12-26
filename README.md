# .dotfiles

This repository contains all my necessary settings for Manjaro KDE Plasma for:

- Neovim
- oh-my-zsh
- zsh

## Requirements

- [stow](https://github.com/aspiers/stow)

## Usage

Clone the config to your home directory `~` or `$HOME`. 
For `oh-my-zsh` plugins, first install `oh-my-zsh`:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then install all necessary packages through your package manager, e.g.:

```bash
pamac install stow rust zoxide unzip fzf lazygit
```

After that you can update the git submodules:

```bash
git submodule update --init --recursive
```

At last run `stow .` to initialize all configuration files. This creates symlinks to all configuration files and allows you to use this configuration.

If this fails, delete every file which created a warning (maybe I can force it? Have to check that again)

