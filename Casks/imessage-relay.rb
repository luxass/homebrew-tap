cask "imessage-relay" do
  version "0.3.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000" # sha-update-id: imessage-relay-macos-universal

  url "https://github.com/luxass/imessage-relay/releases/download/v#{version}/imessage-relay-#{version}-macos-universal.zip"
  name "iMessage Relay"
  desc "Menu bar app for the local Apple Messages relay"
  homepage "https://github.com/luxass/imessage-relay"

  depends_on macos: :sonoma

  app "iMessage Relay.app"
end
