cask "rodent" do
  arch arm: "arm64", intel: "x64"

  version "1.3.4"
  sha256 arm:   "0c8e47fa75ac9fa0b5e7d029f0f1267257cbbe1078e595c29615d4173cd9d039",
         intel: "56b88c798dfaa0dbb2d1d39db22e668e5aea71f27996778c532aa51d20777523"

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
