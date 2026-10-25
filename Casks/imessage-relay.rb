cask "imessage-relay" do
  version "0.4.0"
  sha256 "e858410190b3655f956dc877bec65e6bbe1cda1c2d525198ea2f14d22601a112" # sha-update-id: imessage-relay-macos-universal

  url "https://github.com/luxass/imessage-relay/releases/download/v#{version}/imessage-relay-#{version}-macos-universal.zip"
  name "iMessage Relay"
  desc "Menu bar app and CLI for the local Apple Messages relay"
  homepage "https://github.com/luxass/imessage-relay"

  conflicts_with cask: "imessage-relay@rc"
  depends_on macos: :sonoma

  # The existing 0.4.0 ZIP predates the combined app and CLI archive.
  if version.to_s == "0.4.0"
    depends_on formula: "imessage-relay-cli"
  else
    binary "#{staged_path}/imessage-relay"
  end

  app "iMessage Relay.app"
end
