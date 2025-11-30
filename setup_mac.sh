#!/usr/bin/env bash

set -e

echo "===== Setting up macOS dev environment ====="

##############################################
# 1. Install Homebrew (if not installed)
##############################################
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  # [web:12]
  # Add brew to PATH for current session (Apple Silicon default)
  /opt/homebrew/bin/brew shellenv >/dev/null 2>&1 && eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew already installed. Updating..."
  brew update  # [web:4]
fi

##############################################
# 2. Install iTerm2
##############################################
if ! ls /Applications | grep -qi "iTerm.app"; then
  echo "Installing iTerm2..."
  brew install --cask iterm2  # [web:22]
else
  echo "iTerm2 already installed. Skipping."
fi

##############################################
# 3. Install Firefox (via Homebrew)
##############################################
if ! ls /Applications | grep -qi "Firefox.app"; then
  echo "Installing Firefox..."
  brew install --cask firefox  # [web:2][web:6]
else
  echo "Firefox already installed. Skipping."
fi

##############################################
# 4. Install Flycut
##############################################
if ! ls /Applications | grep -qi "Flycut.app"; then
  echo "Installing Flycut..."
  brew install --cask flycut  # [web:13][web:7]
else
  echo "Flycut already installed. Skipping."
fi

##############################################
# 5. Install Python, Node.js, VS Code
##############################################
echo "Installing Python, Node.js, and VS Code..."
brew install python node  # [web:11][web:14]
brew install --cask visual-studio-code  # [web:20]

##############################################
# 6. Install Oh My Zsh and zsh-autosuggestions
##############################################
# Install Oh My Zsh (non-interactive)
if [ ! -d "${ZSH:-$HOME/.oh-my-zsh}" ]; then
  echo "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  # [web:12]
else
  echo "Oh My Zsh already installed. Skipping."
fi

echo "Installing zsh-autosuggestions..."
brew install zsh-autosuggestions  # [web:16]

##############################################
# 7. Configure zsh-autosuggestions in .zshrc
##############################################
ZSHRC="${HOME}/.zshrc"
AUTOSUGGEST_LINE='source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh'

if ! grep -Fq "zsh-autosuggestions.zsh" "$ZSHRC" 2>/dev/null; then
  echo "Configuring zsh-autosuggestions in ~/.zshrc ..."
  {
    echo ""
    echo "# Enable zsh-autosuggestions"
    echo "$AUTOSUGGEST_LINE"
  } >> "$ZSHRC"
else
  echo "zsh-autosuggestions already configured in ~/.zshrc. Skipping."
fi

echo ""
echo "===== All done! ====="
echo "Please restart your terminal (or run 'exec zsh') for zsh-autosuggestions to take effect."
echo "You can now install Vimium inside Firefox from its add-ons store using the Vimium GitHub page instructions."  # [attached_file:1]

