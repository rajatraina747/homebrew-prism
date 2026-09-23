cask "prism-downloader" do
  version "2.1.0"
  sha256 "3c8a49358a424909a9c0c1dd4bb6abfde3b33c93169458f9b372cd1afc9c90ca"

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

  # Both identifiers on purpose. 2.0 moved the bundle id from com.prism.app to
  # com.rainacorp.prism, and that migration copies — it never moves and never
  # deletes the old directory, which stays as a fallback. So anyone who came
  # through an upgrade has data under both names, and zapping only one would
  # leave the other behind.
  zap trash: [
    "~/Library/Application Support/com.prism.app",
    "~/Library/Application Support/com.rainacorp.prism",
    "~/Library/Caches/com.prism.app",
    "~/Library/Caches/com.rainacorp.prism",
    "~/Library/Preferences/com.prism.app.plist",
    "~/Library/Preferences/com.rainacorp.prism.plist",
    "~/Library/Preferences/com.prism.app.allowed-dirs.json",
    "~/Library/Preferences/com.rainacorp.prism.allowed-dirs.json",
    "~/Library/Saved Application State/com.prism.app.savedState",
    "~/Library/Saved Application State/com.rainacorp.prism.savedState",
    "~/Library/WebKit/com.prism.app",
    "~/Library/WebKit/com.rainacorp.prism",
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
