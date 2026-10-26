cask "imessage-relay@rc" do
  version "0.5.0-rc.3"
  sha256 "6acb306f202a7488c3cf32508b3bd8c55dede985d1d779ccc871f97d23bafb56" # sha-update-id: imessage-relay-macos-universal

  url "https://github.com/luxass/imessage-relay/releases/download/v#{version}/imessage-relay-#{version}-macos-universal.zip"
  name "iMessage Relay RC"
  desc "Menu bar app and CLI for Apple Messages (release candidate)"
  homepage "https://github.com/luxass/imessage-relay"

  conflicts_with cask: "imessage-relay"
  depends_on macos: :sonoma

  app "iMessage Relay.app"
  binary "#{staged_path}/imessage-relay"
end
