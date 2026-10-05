#!/usr/bin/env bash
set -euo pipefail

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
	echo "Usage: $(basename "$0") [-h|--help]"
	echo "Link dotfiles and apply OS/container-specific config."
	exit 0
fi

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Detect OS and environment
IS_MAC=$([[ "$OSTYPE" == "darwin"* ]] && echo true || echo false)
IS_CONTAINER=$([ -f /.dockerenv ] || [ -n "${REMOTE_CONTAINERS:-}" ] || [ -n "${DEVCONTAINER:-}" ] && echo true || echo false)

# 2. Base configs (needed everywhere: zsh/bash, git aliases, claude rules)
mkdir -p ~/.claude
ln -sf "$DOTFILES_DIR/claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$DOTFILES_DIR/git/.gitignore" ~/.gitignore

# 3. macOS only (GUI, Homebrew, specific utilities)
if [ "$IS_MAC" = true ]; then
	echo "Configuring macOS environment..."
	# brew install ... or defaults write ...
fi

# 4. Dev container specifics
if [ "$IS_CONTAINER" = true ]; then
	echo "Configuring Dev Container environment..."
	# Minimal setup: skip heavy GUI tools
fi
