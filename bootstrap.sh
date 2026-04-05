#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_step() {
  printf '\n==> %s\n' "$1"
}

ensure_macos() {
  if [[ "$(uname -s)" != "Darwin" ]]; then
    echo "This setup is intended for macOS only."
    exit 1
  fi
}

run_script() {
  local script_name="$1"
  print_step "Running ${script_name}"
  bash "${ROOT_DIR}/${script_name}"
}

ensure_macos

print_step "Starting macOS bootstrap"
run_script "folders.sh"
run_script "brew.sh"
run_script "defaults.sh"
run_script "dock.sh"
run_script "git.sh"
run_script "zsh.sh"
run_script "symlinks.sh"

print_step "Done"
echo "Some changes may require a Dock/Finder restart, logout, or full reboot."
