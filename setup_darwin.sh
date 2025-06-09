#!/usr/bin/env zsh

echo "Installing Homebrew..."

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew already installed"
fi

echo "Installing packages..."
brew install fd bat ripgrep fnm curl wget fzf lazygit oh-my-posh neovim zoxide git-delta go tmux gh jq stow

echo "Installing packages..."
brew install --cask alacritty raycast

echo "Installing fonts..."
brew install --cask font-hack-nerd-font

echo "Setup complete, Restart terminal."
