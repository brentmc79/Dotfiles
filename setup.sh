#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

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

# --- Oh My Zsh ---
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh is already installed. Updating..."
  sh $HOME/.oh-my-zsh/tools/upgrade.sh
else
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# --- Set Zsh as default shell if specified in Brewfile ---
if grep -q "brew \"zsh\"" Brewfile; then
  echo "Zsh found in Brewfile. Checking if it's the default shell."
  if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting Zsh as the default shell..."
    if [[ "$(uname)" == "Darwin" ]]; then
      # macOS
      current_shell=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
      sudo dscl . -change /Users/$USER UserShell "$current_shell" /bin/zsh
    elif [[ "$(uname)" == "Linux" ]]; then
      # Linux (e.g., Fedora)
      chsh -s "$(which zsh)"
    else
      echo "Unsupported OS for automatic Zsh default shell setting."
    fi
  else
    echo "Zsh is already the default shell."
  fi
else
  echo "Zsh not found in Brewfile. Skipping default shell setting."
fi
echo "Please restart your terminal or log out and back in for the default shell change to take effect."

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
