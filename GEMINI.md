# Gemini Project Overview: Dotfiles

This directory contains a set of dotfiles and a setup script to configure a development environment. It's designed to be used on macOS and Fedora.

## Project Overview

The primary goal of this project is to provide a consistent development environment across different machines. It includes configurations for:

*   **Zsh:** A powerful shell with custom prompts and aliases.
*   **Vim:** A highly configured text editor with plugins managed by `vim-plug`.
*   **Git:** Basic git configuration with aliases.
*   **Homebrew:** A package manager for macOS and Linux, used to install various tools and applications listed in the `Brewfile`.

## Setup and Installation

To set up the environment, run the following command from the root of this directory:

```bash
bash setup.sh
```

The `setup.sh` script will:

1.  Install [Homebrew](https://brew.sh/) if it's not already installed.
2.  Install all the packages listed in the `Brewfile` using `brew bundle`.
3.  Install [Oh My Zsh](https://ohmyz.sh/) if it's not already installed.
4.  If `zsh` is listed in the `Brewfile`, it will set Zsh as the default shell.
5.  Create symlinks for the dotfiles in this directory to your home directory.

## Key Files

*   `setup.sh`: The main installation and setup script.
*   `Brewfile`: A list of packages to be installed by Homebrew. This includes command-line tools, GUI applications, and VS Code extensions.
*   `.zshrc`: Configuration file for the Zsh shell. It sets up the prompt, aliases, and environment variables.
*   `.vimrc`: Configuration file for the Vim editor. It customizes the editor's behavior and manages plugins using `vim-plug`.
*   `.gitconfig`: Git configuration file for user identity and aliases.
*   `.ohmyzshrc`: This file is for Oh My Zsh configuration.
