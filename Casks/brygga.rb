cask "brygga" do
  version "0.1.2"
  sha256 "708348c8a3df04e83061ade8d24047f019e11e9fcc729e733ef2e26713813830"

  url "https://github.com/buggerman/Brygga/releases/download/v#{version}/Brygga-v#{version}.dmg",
      verified: "github.com/buggerman/Brygga/"
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
    → confirm. If Gatekeeper still refuses, strip the quarantine attribute:

      xattr -cr /Applications/Brygga.app
  EOS
end
