cask "prism" do
  version "1.2.0"
  sha256 "40248e0b10a4cf6de8aa71cdfafee9c531fe6c950307e11c671bed950b8429ec"

  url "https://github.com/rajatraina747/prism/releases/download/v#{version}/Prism_#{version}_aarch64.dmg"
  name "Prism"
  desc "Video downloader powered by yt-dlp"
  homepage "https://github.com/rajatraina747/prism"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos
  depends_on arch: :arm64

  app "Prism.app"

  zap trash: [
    "~/Library/Application Support/com.prism.app",
    "~/Library/Caches/com.prism.app",
    "~/Library/Preferences/com.prism.app.plist",
    "~/Library/Saved Application State/com.prism.app.savedState",
    "~/Library/WebKit/com.prism.app",
  ]

  caveats do
    <<~EOS
      Prism is ad-hoc signed (not notarized). If macOS blocks the first launch,
      right-click Prism.app and choose "Open".
    EOS
  end
end
