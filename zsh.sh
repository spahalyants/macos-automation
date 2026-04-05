#!/usr/bin/env bash
set -euo pipefail

ZSHRC="${HOME}/.zshrc"
touch "${ZSHRC}"

append_if_missing() {
  local line="$1"
  grep -Fqx "$line" "${ZSHRC}" || printf '%s\n' "$line" >> "${ZSHRC}"
}

echo "Configuring zsh..."

append_if_missing ''
append_if_missing '# Added by macos-setup'
append_if_missing 'export PATH="$HOME/bin:$PATH"'
append_if_missing 'alias ll="eza -la --icons"'
append_if_missing 'alias ls="eza"'
append_if_missing 'alias gs="git status"'
append_if_missing 'alias ga="git add ."'
append_if_missing 'alias gc="git commit -m"'
append_if_missing 'alias gp="git push"'
append_if_missing 'alias ..="cd .."'
append_if_missing 'alias ...="cd ../.."'
append_if_missing 'alias dps="docker ps"'
append_if_missing 'alias dcu="docker compose up"'
append_if_missing 'alias dcd="docker compose down"'
append_if_missing 'alias reload="source ~/.zshrc"'

if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix)"
  FZF_SCRIPT="${BREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
  if [[ -f "${FZF_SCRIPT}" ]]; then
    append_if_missing "[ -f \"${FZF_SCRIPT}\" ] && source \"${FZF_SCRIPT}\""
  fi
fi

echo "zsh configured."
