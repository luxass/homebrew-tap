cask "imessage-relay" do
  version "0.3.0"
  sha256 "ad2d2fcbff7dcd3d5a49676303e238f204c7e250d1a7d4c68497835ef363757e" # sha-update-id: imessage-relay-macos-universal

  url "https://github.com/luxass/imessage-relay/releases/download/v#{version}/imessage-relay-#{version}-macos-universal.zip"
  name "iMessage Relay"
  desc "Menu bar app for the local Apple Messages relay"
  homepage "https://github.com/luxass/imessage-relay"

  depends_on formula: "imessage-relay-cli"
  depends_on macos: :sonoma

  app "iMessage Relay.app"
end
