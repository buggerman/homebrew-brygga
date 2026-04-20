cask "brygga@nightly" do
  version "52"
  sha256 :no_check

  url "https://github.com/buggerman/Brygga/releases/download/nightly/Brygga-nightly.dmg"
  name "Brygga (nightly)"
  desc "Native macOS IRC client built in Swift and SwiftUI — rolling nightly build"
  homepage "https://github.com/buggerman/Brygga"

  livecheck do
    # The nightly tag is deleted and recreated on every push to main. We can't
    # use the DMG's URL directly because it's stable — instead, pull the build
    # number out of the release's own title ("Brygga nightly (build 52 — …)").
    # Homebrew treats any change in this string as "upgrade available".
    url "https://api.github.com/repos/buggerman/Brygga/releases/tags/nightly"
    strategy :json do |json|
      match = json["name"]&.match(/build\s+(\d+)/i)
      match && match[1]
    end
  end

  # Same /Applications/Brygga.app install path as the stable cask; running
  # both side-by-side is not meaningful.
  conflicts_with cask: "buggerman/brygga/brygga"

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
    This is the rolling NIGHTLY build, rebuilt on every push to main. Expect
    rough edges between versions. For stable, use `brygga` instead.

    Brygga is ad-hoc signed, not notarized by Apple. On first launch macOS
    will say the app can't be verified. Right-click (or Ctrl-click) → Open
    → confirm. If Gatekeeper still refuses, strip the quarantine attribute:

      xattr -cr /Applications/Brygga.app

    Run `brew upgrade --cask buggerman/brygga/brygga@nightly` any time to
    pick up the current nightly.
  EOS
end
