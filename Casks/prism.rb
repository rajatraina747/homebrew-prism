cask "prism" do
  version "1.9.1"
  sha256 "726ba75b67276e5725cb273aa9e3e26ee62996833d0a961b030edc4e05f1202f"

  url "https://github.com/rajatraina747/prism/releases/download/v#{version}/Prism_#{version}_aarch64.dmg"
  name "Prism"
  desc "Video and torrent downloader powered by yt-dlp and librqbit"
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
    "~/Library/Preferences/com.prism.app.allowed-dirs.json",
    "~/Library/Saved Application State/com.prism.app.savedState",
    "~/Library/WebKit/com.prism.app",
  ]

  caveats do
    <<~EOS
      Prism is ad-hoc signed (not notarized). If macOS blocks the first launch,
      open the app once, then go to System Settings > Privacy & Security and
      click "Open Anyway" (macOS 15+), or run:
        xattr -dr com.apple.quarantine /Applications/Prism.app
    EOS
  end
end
