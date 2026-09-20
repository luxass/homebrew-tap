cask "imessage-relay" do
  version "0.3.1"
  sha256 "3c84dd4e5fa6e7c59cfb90c531fc7ecc6bdd546d6f13dd2a84424d1bdb98a4b3" # sha-update-id: imessage-relay-macos-universal

  url "https://github.com/luxass/imessage-relay/releases/download/v#{version}/imessage-relay-#{version}-macos-universal.zip"
  name "iMessage Relay"
  desc "Menu bar app for the local Apple Messages relay"
  homepage "https://github.com/luxass/imessage-relay"

  depends_on formula: "imessage-relay-cli"
  depends_on macos: :sonoma

  app "iMessage Relay.app"
end
