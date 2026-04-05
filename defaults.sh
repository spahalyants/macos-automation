#!/usr/bin/env bash
set -euo pipefail

SCREENSHOT_DIR="${HOME}/Desktop/Screenshots"
mkdir -p "${SCREENSHOT_DIR}"

echo "Applying macOS defaults..."

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.15
defaults write com.apple.dock tilesize -int 42
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock show-recents -bool false

defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

defaults write com.apple.screencapture location -string "${SCREENSHOT_DIR}"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

killall Dock || true
killall Finder || true
killall SystemUIServer || true

echo "macOS defaults applied."
