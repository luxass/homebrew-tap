cask "imessage-relay@rc" do
  version "0.5.1-rc.3"
  sha256 "6a5d266e2b91f85bc0faeec393a564660749dd8e4258fc17950a94023657a81f" # sha-update-id: imessage-relay-macos-universal

  url "https://github.com/luxass/imessage-relay/releases/download/v#{version}/imessage-relay-#{version}-macos-universal.zip"
  name "iMessage Relay RC"
  desc "Menu bar app and CLI for Apple Messages (release candidate)"
  homepage "https://github.com/luxass/imessage-relay"

  conflicts_with cask: "imessage-relay"
  depends_on macos: :sonoma

  app "iMessage Relay.app"
  binary "#{staged_path}/imessage-relay"
end
