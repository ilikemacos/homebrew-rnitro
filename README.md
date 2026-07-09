# homebrew-rnitro

Homebrew tap for **rNitro** — a free, real-time CPU monitor for Apple Silicon Macs.

## Quick install

```bash
brew tap ilikemacos/rnitro
brew install --cask rnitro
```

**Beta** (all AI providers + experimental features):

```bash
brew install --cask rnitro@beta
```

## What gets installed

- Downloads the **App ZIP** from [GitHub Releases](https://github.com/ilikemacos/rNitro/releases)
- Installs `rNitro.app` to `/Applications`
- Apple Silicon (arm64) only; macOS 12 Monterey or later

On first launch, macOS may block the ad-hoc-signed app — right-click **rNitro.app** → **Open** → **Open** once.

## Maintainer: regenerate casks after a release

From `rnitro-site/` (after `build-app-zip.py` and `publish-github-releases.py`):

```bash
python3 build-homebrew-cask.py
```

This updates `homebrew/Casks/` and syncs to this repo's `Casks/` folder. Commit and push.