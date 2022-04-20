cask "ovice-app" do
  version "1.0.0"
  name "oVice app"
  desc "Desktop application for oVice user"
  homepage "https://github.com/sskmy1024y/oVice-app"
  sha256 :no_check

  if Hardware::CPU.intel? 
    url "https://github.com/sskmy1024y/oVice-app/releases/download/v#{version}/oVice-app-#{version}.dmg"
  else
    url "https://github.com/sskmy1024y/oVice-app/releases/download/v#{version}/oVice-app-#{version}-arm64.dmg"
  end

  depends_on macos: ">= :sierra"

  app "oVice-app.app"

  postflight do
    system "sudo", "xattr", "-r", "-d", "com.apple.quarantine", "/Applications/oVice-app.app"
  end

  uninstall quit: "com.sskmy1024y.ovice-app"

  zap trash: [
    "~/Library/Application Support/ovice-app/"
  ]
end
