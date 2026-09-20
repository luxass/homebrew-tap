class ImessageRelayCli < Formula
  desc "Command-line interface for the local Apple Messages relay"
  homepage "https://github.com/luxass/imessage-relay"
  version "0.3.0"
  license "MIT"

  # v0.3.0 predates the CLI and archive rename.
  if version.to_s == "0.3.0"
    url "#{homepage}/releases/download/v#{version}/imessage-relay-server-#{version}-macos-universal.tar.gz"
  else
    url "#{homepage}/releases/download/v#{version}/imessage-relay-cli-#{version}-macos-universal.tar.gz"
  end
  sha256 "6367b1db054c2156f7e2752c264980ffb36c44d11824706dc5e26dab6cde3375" # sha-update-id: imessage-relay-cli-macos-universal

  depends_on :macos

  on_macos do
    depends_on macos: :sonoma
  end

  def install
    if version.to_s == "0.3.0"
      bin.install "relay-server"
    else
      libexec.install "imessage-relay", *Dir["*.bundle"]
      bin.write_exec_script libexec/"imessage-relay"
    end
  end

  test do
    command = version.to_s == "0.3.0" ? "relay-server" : "imessage-relay"
    assert_equal version.to_s, shell_output("#{bin}/#{command} --version").strip
    assert_predicate libexec/"PhoneNumberKit_PhoneNumberKit.bundle", :directory? if version.to_s != "0.3.0"
  end
end
