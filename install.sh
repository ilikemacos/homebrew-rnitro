#!/bin/bash
# rNitro installer — same result as: brew tap ilikemacos/rnitro && brew install rnitro
# Use when Homebrew is unavailable or /opt/homebrew is not writable.
set -euo pipefail

URL="https://github.com/ilikemacos/rNitro/releases/download/v8.3.6-Final/rNitro-v8.3.6-Final-arm64.zip"
SHA="0cbda46b537adf349c38c6dc3f5d080d866d601eb2a75009b61346c67a03002a"
VERSION="v8.3.6 Final"

if [[ "$(uname -m)" != "arm64" ]]; then
  echo "rNitro requires Apple Silicon (arm64)." >&2
  exit 1
fi

if [[ -w /Applications ]]; then
  DEST="/Applications/rNitro.app"
else
  DEST="$HOME/Applications/rNitro.app"
  mkdir -p "$HOME/Applications"
fi

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

echo "→ Downloading rNitro $VERSION"
curl -fsSL -o "$TMP/rnitro.zip" "$URL"
echo "$SHA  $TMP/rnitro.zip" | shasum -a 256 -c -

ditto -xk "$TMP/rnitro.zip" "$TMP/extract"
[[ -d "$TMP/extract/rNitro.app" ]] || { echo "rNitro.app missing in archive" >&2; exit 1; }

rm -rf "$DEST"
ditto "$TMP/extract/rNitro.app" "$DEST"
xattr -dr com.apple.quarantine "$DEST" 2>/dev/null || true

BIN_DIR="${HOME}/.local/bin"
mkdir -p "$BIN_DIR"
cat > "$BIN_DIR/rnitro" <<'LAUNCHER'
#!/bin/bash
APP="/Applications/rNitro.app"
[[ -d "$APP" ]] || APP="$HOME/Applications/rNitro.app"
exec /usr/bin/open -a "$APP" "$@"
LAUNCHER
chmod +x "$BIN_DIR/rnitro"

echo ""
echo "✅ rNitro installed to $DEST"
echo "   Run: rnitro"
echo "   First launch: right-click → Open if Gatekeeper blocks it."

