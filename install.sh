#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Extensions for code-server (the browser VS Code)
extensions=(
    "anthropic.claude-code",
    "openai.chatgpt"
)

CODE_SERVER="$HOME/.local/bin/code-server"
if [ -x "$CODE_SERVER" ]; then
  for ext in "${extensions[@]}"; do
    "$CODE_SERVER" --install-extension "$ext" || echo "Failed to install $ext"
  done
else
  echo "code-server not found, skipping extensions"
fi
