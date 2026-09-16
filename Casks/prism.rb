cask "prism" do
  version "1.9.2"
  sha256 "8273b976a91160405176cc34ec323cdc275b80b2f7a45d45a33c593a2bcb4dda"

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
