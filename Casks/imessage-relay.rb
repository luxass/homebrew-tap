cask "imessage-relay" do
  version "0.3.2"
  sha256 "d41cbf62777a6c1fd4c39d2bad61185f008d554a5c7f00a9ec225177ff057d0f" # sha-update-id: imessage-relay-macos-universal

  url "https://github.com/luxass/imessage-relay/releases/download/v#{version}/imessage-relay-#{version}-macos-universal.zip"
  name "iMessage Relay"
  desc "Menu bar app for the local Apple Messages relay"
  homepage "https://github.com/luxass/imessage-relay"

  depends_on formula: "imessage-relay-cli"
  depends_on macos: :sonoma

  app "iMessage Relay.app"
end
