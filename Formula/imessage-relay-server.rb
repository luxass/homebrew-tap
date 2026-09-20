class ImessageRelayServer < Formula
  desc "Local HTTP API for Apple Messages"
  homepage "https://github.com/luxass/imessage-relay"
  version "0.3.0"
  license "MIT"

  url "#{homepage}/releases/download/v#{version}/imessage-relay-server-#{version}-macos-universal.tar.gz"
  sha256 "6367b1db054c2156f7e2752c264980ffb36c44d11824706dc5e26dab6cde3375" # sha-update-id: imessage-relay-server-macos-universal

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
