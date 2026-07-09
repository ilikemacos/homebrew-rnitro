cask "rnitro" do
  version "8.3.5"
  sha256 "8eee9058c7b9dc23cb265edef7214b1a5aa96c4fde29ac3f34550005ddc139a6"

  url "https://github.com/ilikemacos/rNitro/releases/download/v8.3.5-Final/rNitro-v8.3.5-Final-arm64.zip"
  name "rNitro"
  desc "Real-time CPU monitor for macOS — usage, temperature, and per-core stats (stable)"
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

    GitHub release: https://github.com/ilikemacos/rNitro/releases/tag/v8.3.5-Final
  EOS
end

