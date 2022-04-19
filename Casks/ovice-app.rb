cask "ovice-app" do
  version "1.0.0"
  name "oVice app"
  desc "Desktop application for oVice user"
  homepage "https://github.com/sskmy1024y/oVice-app"

  if Hardware::CPU.intel? 
    url "https://github.com/sskmy1024y/oVice-app/releases/download/v#{version}/oVice-app_#{version}_x64.dmg"
    sha256 "928d896ee874df0516e23e26bc6e0e5008d408e818cb4dbd0934c9ef0f705ca4"
  else
    url "https://github.com/sskmy1024y/oVice-app/releases/download/v#{version}/oVice-app_#{version}_arm64.dmg"
    sha256 "c205e86434b9a83595c4e8758fbbe1e708e108084376d9a870f93a6362aca0eb"
  end

  depends_on macos: ">= :yosemite"

  app "oVice-app.app"

  postflight do
    system "sudo", "xattr", "-r", "-d", "com.apple.quarantine", "/Applications/oVice-app.app"
  end

  uninstall quit: "com.sskmy1024y.ovice-app"

  zap trash: [
    "~/Library/Application Support/ovice-app/"
  ]
end
