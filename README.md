# .dotfiles

This repository contains all my necessary settings for Manjaro KDE Plasma for:

- Neovim
- oh-my-zsh
- zsh

## Requirements

- [stow](https://github.com/aspiers/stow)

## Usage

Clone the config to your home directory `~` or `$HOME`. Run `stow .` inside the cloned directory. This creates symlinks to all configuration files and allows you to use this configuration.

To add the `oh-my-zsh` plugins, run `git submodule update --init --recursive`.
