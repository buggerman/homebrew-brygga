cask "brygga" do
  version "0.1.4"
  sha256 "2700691ff5b50d6d13263787ec4d235926b46fcc60bb16e16bb19153aaf95dc1"

  url "https://github.com/buggerman/Brygga/releases/download/v#{version}/Brygga-v#{version}.dmg"
  name "Brygga"
  desc "Native macOS IRC client built in Swift and SwiftUI"
  homepage "https://github.com/buggerman/Brygga"

  # Apple Silicon only DMGs. Intel is source-compatible but not shipped.
  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "Brygga.app"

  zap trash: [
    "~/Library/Application Support/Brygga",
    "~/Library/Logs/Brygga",
    "~/Library/Preferences/org.buggerman.Brygga.plist",
    "~/Library/Saved Application State/org.buggerman.Brygga.savedState",
  ]

  caveats <<~EOS
    Brygga is ad-hoc signed, not notarized by Apple. On first launch macOS
    will say the app can't be verified. Right-click (or Ctrl-click) → Open
    → confirm. If Gatekeeper still refuses, strip the quarantine attribute
    once and launch again:

      xattr -cr /Applications/Brygga.app

    Homebrew deliberately does not strip the attribute for you — that would
    silently bypass a macOS security check on your behalf. Running it
    yourself is a conscious one-time opt-in.
  EOS
end
