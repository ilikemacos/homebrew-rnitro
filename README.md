# homebrew-rnitro

## Install with Homebrew

```bash
brew tap ilikemacos/rnitro
brew install rnitro
```

Installs `rNitro.app` to `/Applications` (or `~/Applications` if `/Applications` is not writable) and adds an `rnitro` command.

## Homebrew permission errors?

If you see `Cellar is not writable` or `Permission denied` on `/opt/homebrew`:

```bash
sudo chown -R "$(whoami)" /opt/homebrew/Cellar /opt/homebrew/Library
```

Then run `brew tap` and `brew install rnitro` again.

## Install without Homebrew

Same result as the formula — downloads the GitHub App ZIP:

```bash
curl -fsSL https://raw.githubusercontent.com/ilikemacos/homebrew-rnitro/main/install.sh | bash
```

Apple Silicon · macOS 12+