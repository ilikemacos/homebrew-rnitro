cask "rnitro@beta" do
  version "8.3.8"
  sha256 "beff24033fbf4bd35928b62174c0767607ec1aa6b5654bd6a40f39229e75c94b"

  url "https://github.com/ilikemacos/rNitro/releases/download/v8.3.8-Beta/rNitro-v8.3.8-Beta-arm64.zip"
  name "rNitro"
  desc "Real-time CPU monitor for macOS — usage, temperature, and per-core stats (beta, all AI providers)"
  homepage "https://getrnitro.netlify.app/"

  depends_on macos: ">= :monterey"
  arch only: :arm64

  app "rNitro.app"

  zap trash: [
    "~/Library/Logs/rNitro",
    "~/Library/Caches/rNitro",
    "~/Library/Caches/rNitro/update-staging",
    "~/Library/Application Support/com.rnitro.cpumonitor",
    "~/Library/Preferences/com.rnitro.cpumonitor.plist",
    "~/Library/Preferences/rnitro.soloMode.plist",
    "~/Library/Preferences/rnitro.classicScrollMode.plist",
    "~/Library/Preferences/rnitro.showWeather.plist",
    "~/Library/Preferences/rnitro.showStressUI.plist",
    "~/Library/Preferences/rnitro.showBenchmarkUI.plist",
    "~/Library/Preferences/rnitro.showNetworkUI.plist",
    "~/Library/Preferences/rnitro.menuBarMode.plist",
    "~/Library/Preferences/rnitro.menuBarLayout.plist",
    "~/Library/Preferences/rnitro.menuBarSlots.plist",
    "~/Library/Preferences/rnitro.uiStyle.plist",
    "~/Library/Preferences/rnitro.launchAtLogin.plist",
    "~/Library/Preferences/rnitro.firstLaunchTipsSeen.plist",
    "~/Library/Preferences/rnitro.advisor.thresholds.plist",

  ]

  caveats <<~EOS
    rNitro is ad-hoc signed. On first launch, right-click rNitro.app in Applications
    and choose Open, or allow it in System Settings → Privacy & Security.

    GitHub release: https://github.com/ilikemacos/rNitro/releases/tag/v8.3.8-Beta
  EOS
end

