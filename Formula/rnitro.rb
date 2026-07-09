class Rnitro < Formula
  desc "Real-time CPU monitor for macOS — usage, temperature, and per-core stats"
  homepage "https://getrnitro.netlify.app/"
  url "https://github.com/ilikemacos/rNitro/releases/download/v8.3.5-Final/rNitro-v8.3.5-Final-arm64.zip"
  version "8.3.5"
  sha256 "8eee9058c7b9dc23cb265edef7214b1a5aa96c4fde29ac3f34550005ddc139a6"
  license "MIT"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  def install
    app = "rNitro.app"
    odie "Expected #{app} in the download archive" unless (buildpath/app).directory?

    app_dest = Pathname("/Applications")/app
    rm_rf app_dest if app_dest.exist?
    cp_r buildpath/app, app_dest

    (bin/"rnitro").write <<~EOS
      #!/bin/bash
      exec /usr/bin/open -a "/Applications/rNitro.app" "$@"
    EOS
    (bin/"rnitro").chmod 0755
  end

  def post_install
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "/Applications/rNitro.app"
  end

  def uninstall
    rm_rf "/Applications/rNitro.app"
  end

  def caveats
    <<~EOS
      rNitro was installed to /Applications/rNitro.app
      Run `rnitro` from Terminal or open it from Applications.

      First launch: if macOS blocks the app, right-click rNitro.app → Open → Open.
      Release: https://github.com/ilikemacos/rNitro/releases/tag/v8.3.5-Final
    EOS
  end

  test do
    assert_path_exists "/Applications/rNitro.app"
    assert_predicate bin/"rnitro", :exist?
  end
end

