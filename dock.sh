#!/usr/bin/env bash
set -euo pipefail

if ! command -v dockutil >/dev/null 2>&1; then
  echo "dockutil not found. Skipping Dock item layout."
  exit 0
fi

echo "Configuring Dock items..."

dockutil --remove all --no-restart || true

add_app() {
  local app_path="$1"
  if [[ -d "$app_path" ]]; then
    dockutil --add "$app_path" --no-restart || true
  else
    echo "Skipping missing app: $app_path"
  fi
}

add_app "/System/Applications/Launchpad.app"
add_app "/Applications/Safari.app"
add_app "/Applications/Google Chrome.app"
add_app "/Applications/iTerm.app"
add_app "/Applications/Visual Studio Code.app"
add_app "/Applications/IntelliJ IDEA CE.app"
add_app "/Applications/Docker.app"
add_app "/System/Applications/System Settings.app"

killall Dock || true
echo "Dock layout configured."
