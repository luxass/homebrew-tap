class ImessageRelayServer < Formula
  desc "Local HTTP API for Apple Messages"
  homepage "https://github.com/luxass/imessage-relay"
  version "0.2.0"
  license "MIT"

  url "#{homepage}/releases/download/v#{version}/imessage-relay-server-#{version}-macos-universal.tar.gz"
  sha256 "d6a5bc552d75fb1b4d3f9d2b98b9a274897235c23d65c9bd0b106f549ca71a5b" # sha-update-id: imessage-relay-server-macos-universal

  depends_on :macos

  on_macos do
    depends_on macos: :sonoma
  end

  def install
    bin.install "relay-server"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/relay-server --version").strip
  end
end
