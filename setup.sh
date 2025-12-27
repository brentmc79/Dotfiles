#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Oh My Zsh ---
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh is already installed. Updating..."
  sh $HOME/.oh-my-zsh/tools/upgrade.sh
else
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# --- Homebrew ---
if command -v brew &>/dev/null; then
  echo "Homebrew is already installed. Updating..."
  brew update
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# --- Homebrew Bundle ---
if [ -f "Brewfile" ]; then
  echo "Installing Homebrew bundle from Brewfile..."
  brew bundle
else
  echo "Brewfile not found. Skipping bundle installation."
fi

# --- Symlink Dotfiles ---
echo "Symlinking dotfiles..."
for file in .*; do
  case $file in
    .|..|.git|.gitignore)
      continue
      ;;
    *)
      ln -sfv "$(pwd)/$file" "$HOME/$file"
      ;;
  esac
done

echo "Setup complete!"
