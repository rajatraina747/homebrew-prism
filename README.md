# homebrew-prism

Homebrew tap for [Prism](https://github.com/rajatraina747/prism), a video
downloader powered by yt-dlp.

## Install

```sh
brew tap rajatraina747/prism
brew install --cask prism
```

## Updating the cask for a new release

After publishing a Prism release:

```sh
VERSION=1.3.0
curl -sL "https://github.com/rajatraina747/prism/releases/download/v${VERSION}/Prism_${VERSION}_aarch64.dmg" | shasum -a 256
```

Then edit `Casks/prism.rb`: bump `version`, replace `sha256`, commit, push.
