cask "rodent" do
  arch arm: "arm64", intel: "x64"

  version "1.3.2"
  sha256 arm:   "0d24e551d9e341c73c4d7442f217886abfd98a3d832cb7c420ad5ac26fbc0a40",
         intel: "25e0a0e07de3cd71dff819a63ee17cec0edb00b2e064fa324812f55bddd65ae4"

  url "https://github.com/CMS-DEV-BUNDLE/marketplace/releases/download/v#{version}/Rodent-#{version}-mac-#{arch}.dmg"
  name "Rodent"
  desc "Developer toolkit desktop app"
  homepage "https://github.com/CMS-DEV-BUNDLE/RODENT"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Rodent.app"

  # Rodent is not signed with an Apple Developer ID. Clear the quarantine flag
  # so Gatekeeper doesn't report the app as "damaged" on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Rodent.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Rodent",
    "~/Library/Preferences/com.cmsdevbundle.rodent.plist",
  ]
end
