# homebrew-brygga

Homebrew tap for [Brygga](https://github.com/buggerman/Brygga) — a native macOS IRC client written in Swift and SwiftUI.

## Install

Stable (recommended):

```sh
brew install --cask buggerman/brygga/brygga
```

Nightly (rolling, rebuilt on every push to main):

```sh
brew install --cask buggerman/brygga/brygga@nightly
```

The first component (`buggerman/brygga`) is the tap; `brew` expands it to this repository. From then on `brew upgrade` picks up new Brygga releases with the rest of your tree — for `brygga@nightly`, Homebrew compares the release's build number on GitHub against the installed version and offers an upgrade when the nightly rolls.

If you prefer to tap first and install separately:

```sh
brew tap buggerman/brygga
brew install --cask brygga             # stable
brew install --cask brygga@nightly     # nightly
```

The two casks install to the same `/Applications/Brygga.app`, so they're mutually exclusive — Homebrew will refuse to install one while the other is present. To switch tracks, uninstall first:

```sh
brew uninstall --cask brygga && brew install --cask brygga@nightly
```

## First-launch caveat

Brygga is **ad-hoc signed**, not notarized by Apple. On first launch macOS will refuse to open it and show *"Brygga can't be verified"*. Two ways around it:

1. In Finder, right-click (or Ctrl-click) the app → **Open** → confirm. This only needs to happen once.
2. If Gatekeeper still refuses (e.g. *"Apple could not verify Brygga is free of malware"* with no Open override), strip the quarantine attribute once:

   ```sh
   xattr -cr /Applications/Brygga.app
   ```

## Requirements

- macOS 15 Sequoia or later
- Apple Silicon (arm64) — the DMG is arm64-only. Intel Macs can [build from source](https://github.com/buggerman/Brygga#building-for-intel-macs).

## Uninstall

```sh
brew uninstall --cask brygga            # removes the app
brew uninstall --cask --zap brygga      # also removes ~/Library/Application Support/Brygga,
                                        # logs under ~/Library/Logs/Brygga, and preferences
```

## Release channels

- **`brygga`** — stable. Follows `v*` tags in the [main Brygga repository](https://github.com/buggerman/Brygga). The cask's `version` and `sha256` are bumped automatically when a new tag is pushed.
- **`brygga@nightly`** — rolling. Always points at the `nightly` tag, which is deleted and recreated on every push to main. The cask uses `sha256 :no_check` because the DMG changes bytes on every push; Homebrew detects new builds via `brew livecheck` against the GitHub Releases API (it reads the build number out of the release title).

## License

The cask formula itself is BSD 3-Clause, matching Brygga.
