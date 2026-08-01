cask "rnitro" do
  version "1.3.32"
  sha256 "c79045d12e0aeef3ad3b5c152a93d945e4ac3e3349acc0b9a407e495f56a3f22"

  # Pinned to the GitHub release asset, not chopstickshq.com: release assets are
  # immutable, so the checksum above can never drift, and the download keeps
  # working independently of the website's hosting.
  url "https://github.com/ilikemacos/rNitro/releases/download/v#{version}-Experimental/rNitro-v#{version}-Experimental.zip"
  name "rNitro"
  desc "Menu bar system monitor showing CPU, temperature, memory, battery, and GPU"
  homepage "https://chopstickshq.com/rnitro/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+)-Experimental$/i)
  end

  depends_on macos: ">= :sonoma"   # Info.plist LSMinimumSystemVersion = 14.0
  depends_on arch: :arm64          # Apple Silicon only

  app "rNitro.app"

  # The build is ad-hoc signed rather than Apple-notarized. Homebrew removes the
  # quarantine attribute on install, so `brew install --cask` users never see the
  # Gatekeeper prompt that a manual .zip download triggers.

  uninstall quit: "com.rnitro.cpumonitor"

  zap trash: [
    "~/Library/Preferences/com.rnitro.cpumonitor.plist",
    "~/Library/Application Support/rNitro",
    "~/Library/Caches/com.rnitro.cpumonitor",
    "~/Library/Saved Application State/com.rnitro.cpumonitor.savedState",
  ]
end
