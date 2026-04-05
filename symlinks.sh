#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="${ROOT_DIR}/dotfiles"

echo "Linking dotfiles..."

link_file() {
  local source_path="$1"
  local target_path="$2"

  if [[ -e "$source_path" ]]; then
    ln -sfn "$source_path" "$target_path"
    echo "Linked $target_path -> $source_path"
  fi
}

link_file "${DOTFILES_DIR}/gitignore_global" "${HOME}/.gitignore_global"
git config --global core.excludesfile "${HOME}/.gitignore_global" || true

echo "Symlinks done."
