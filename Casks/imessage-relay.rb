cask "imessage-relay" do
  version "0.4.0"
  sha256 "e858410190b3655f956dc877bec65e6bbe1cda1c2d525198ea2f14d22601a112" # sha-update-id: imessage-relay-macos-universal

  url "https://github.com/luxass/imessage-relay/releases/download/v#{version}/imessage-relay-#{version}-macos-universal.zip"
  name "iMessage Relay"
  desc "Menu bar app for the local Apple Messages relay"
  homepage "https://github.com/luxass/imessage-relay"

  depends_on formula: "imessage-relay-cli"
  depends_on macos: :sonoma

  app "iMessage Relay.app"
end
