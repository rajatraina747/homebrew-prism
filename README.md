# homebrew-prism

Homebrew tap for [Prism](https://github.com/rajatraina747/prism), a video
and torrent downloader powered by yt-dlp and librqbit.

## Install

```sh
brew install --cask rajatraina747/prism/prism-downloader
```

## Update

```sh
brew upgrade --cask rajatraina747/prism/prism-downloader
```

Prism can also update itself from **Settings → Updates**.

### Why the name isn't just `prism`

Homebrew's main catalogue already has a cask called `prism`: GraphPad Prism,
a statistics app. A bare `brew install --cask prism` or
`brew upgrade --cask prism` picks that one, and for anyone who installed this
cask under its old name it *replaced* Prism with GraphPad Prism. The cask is
now `prism-downloader`. `cask_renames.json` moves existing installs over on
the next `brew update`. Always use the full `rajatraina747/prism/…` name.

## Updating the cask for a new release

After publishing a Prism release, take the DMG's SHA-256 from the release
(`gh api repos/rajatraina747/prism/releases/tags/v<version> --jq '.assets[].digest'`),
then edit `Casks/prism-downloader.rb`: bump `version`, replace `sha256`,
commit, push.
