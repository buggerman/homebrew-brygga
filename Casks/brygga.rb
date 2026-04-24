cask "brygga" do
  version "0.1.3-1"
  sha256 "519d6185772f17ac7e38f3cdf616a66dea513d976ae4226ec7a2c2e6f851dfdd"

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
