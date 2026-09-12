class ImessageRelayServer < Formula
  desc "Local HTTP API for Apple Messages"
  homepage "https://github.com/luxass/imessage-relay"
  version "0.1.0"
  license "MIT"

  url "#{homepage}/releases/download/v#{version}/imessage-relay-server-#{version}-macos-universal.tar.gz"
  sha256 "a7450e0aebba785d11e196287299684984c8c483ef7e3660ecf16f983559a2c2" # sha-update-id: imessage-relay-server-macos-universal

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
