#!/usr/bin/env bash
set -e

echo "Installing qr CLI..."

# Check Homebrew
if ! command -v brew >/dev/null 2>&1; then
    echo "Error: Homebrew is required to install dependencies."
    exit 1
fi

# Check and install qrtool if missing
if ! command -v qrtool >/dev/null 2>&1; then
    echo "Installing qrtool via Homebrew..."
    brew install qrtool
fi

# Target directory
INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "$INSTALL_DIR"

# Copy or symlink script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "$SCRIPT_DIR/qr" "$INSTALL_DIR/qr"
chmod +x "$INSTALL_DIR/qr"

echo "Successfully installed qr to $INSTALL_DIR/qr"
echo "Run 'qr' in your terminal to start!"
