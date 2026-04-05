#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "brew.sh is for macOS only."
  exit 1
fi

install_xcode_clt() {
  if ! xcode-select -p >/dev/null 2>&1; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install || true
    echo "If a popup appears, finish installing Command Line Tools, then re-run this script."
  fi
}

install_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

install_packages() {
  brew update

  brew install \
    git \
    wget \
    curl \
    jq \
    tree \
    fzf \
    ripgrep \
    eza \
    htop \
    mas \
    dockutil || true

  brew install --cask \
    iterm2 \
    visual-studio-code \
    intellij-idea-ce \
    docker \
    google-chrome \
    rectangle || true

  brew cleanup
}

install_xcode_clt
install_homebrew
install_packages

echo "Homebrew and packages are set up."
