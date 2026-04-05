#!/usr/bin/env bash
set -euo pipefail

GIT_NAME="${GIT_USER_NAME:-}"
GIT_EMAIL="${GIT_USER_EMAIL:-}"

echo "Configuring Git..."

git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global fetch.prune true
git config --global core.editor "code --wait"
git config --global core.autocrlf input
git config --global color.ui auto

if [[ -n "${GIT_NAME}" ]]; then
  git config --global user.name "${GIT_NAME}"
  echo "Set Git user.name to ${GIT_NAME}"
else
  echo "GIT_USER_NAME not provided; leaving git user.name unchanged."
fi

if [[ -n "${GIT_EMAIL}" ]]; then
  git config --global user.email "${GIT_EMAIL}"
  echo "Set Git user.email to ${GIT_EMAIL}"
else
  echo "GIT_USER_EMAIL not provided; leaving git user.email unchanged."
fi

echo "Git configured."
