cask "rodent" do
  arch arm: "arm64", intel: "x64"

  version "1.3.3"
  sha256 arm:   "8c6a9bc7258a732c6527737c32ded8beab8c4345062b1a903acab7cc10ce4f01",
         intel: "9b10962c8059bf32f37458dd87babebc7f48794ceb3df1ce3943681c8fef45e0"

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
