# homebrew-brygga

Homebrew tap for [Brygga](https://github.com/buggerman/Brygga) — a native macOS IRC client written in Swift and SwiftUI.

## Install

```sh
brew install --cask buggerman/brygga/brygga
```

The first component (`buggerman/brygga`) is the tap; `brew` expands it to this repository. From then on `brew upgrade` picks up new Brygga releases with the rest of your tree.

If you prefer to tap first and install separately:

```sh
brew tap buggerman/brygga
brew install --cask brygga
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

This tap tracks the **stable** Brygga channel — cask bumps happen automatically when a new `v*` tag is published in the [main Brygga repository](https://github.com/buggerman/Brygga). For the rolling nightly build, download the DMG directly from [`releases/tag/nightly`](https://github.com/buggerman/Brygga/releases/tag/nightly).

## License

The cask formula itself is BSD 3-Clause, matching Brygga.
