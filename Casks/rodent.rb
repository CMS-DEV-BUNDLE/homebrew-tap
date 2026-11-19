cask "rodent" do
  arch arm: "arm64", intel: "x64"

  version "1.3.5"
  sha256 arm:   "36e6c446499fc1b406b47ecc8756deeccf233d7d6d904dd8f442d7f847e400c7",
         intel: "a5168272ce88c96a76978b86fac2171ad2998153bbdbde59f916c78b7b8b4a96"

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
