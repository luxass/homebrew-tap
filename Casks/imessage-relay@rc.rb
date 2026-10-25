cask "imessage-relay@rc" do
  version "0.5.0-rc.2"
  sha256 "2ac684acef23a652ca54725d4ab5da61c755dbb803c9246a8e6c7e5b3f38a16e" # sha-update-id: imessage-relay-macos-universal

  url "https://github.com/luxass/imessage-relay/releases/download/v#{version}/imessage-relay-#{version}-macos-universal.zip"
  name "iMessage Relay RC"
  desc "Menu bar app and CLI for Apple Messages (release candidate)"
  homepage "https://github.com/luxass/imessage-relay"

  conflicts_with cask: "imessage-relay"
  depends_on macos: :sonoma

  app "iMessage Relay.app"
  binary "#{staged_path}/imessage-relay"
end
