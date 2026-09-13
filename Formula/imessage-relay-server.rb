class ImessageRelayServer < Formula
  desc "Local HTTP API for Apple Messages"
  homepage "https://github.com/luxass/imessage-relay"
  version "0.1.2"
  license "MIT"

  url "#{homepage}/releases/download/v#{version}/imessage-relay-server-#{version}-macos-universal.tar.gz"
  sha256 "94e1580a8e21bdcddcc0df9801209de4da747a897df6a96f57c2b98a7789471f" # sha-update-id: imessage-relay-server-macos-universal

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
