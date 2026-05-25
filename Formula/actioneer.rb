class Actioneer < Formula
  desc "CLI tool for GitHub Actions workflows"
  homepage "https://github.com/luxass/actioneer"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e3f212b059591698e0828912814453dce35b2197d609e67ac4180722d80edfa7" # sha-update-id: actioneer-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "65f27f9650c04950ac2d865be1a8e911eb4d29273b0bf23b38cc89c7bc877277" # sha-update-id: actioneer-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ae26eacfd126086042b7cf17372658002be0d65aeb42a4cd63914a23e10ad78" # sha-update-id: actioneer-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1549d0be6c4d7780d882ab65a6e34505f9be542008e28897c7456ab7ee4a17cb" # sha-update-id: actioneer-x86_64-unknown-linux-gnu
    end
  end

  def install
    binary = Dir["**/actioneer"].find { |path| File.file?(path) && File.executable?(path) }
    odie "actioneer binary not found in release archive" if binary.nil?

    bin.install binary => "actioneer"
  end

  test do
    assert_match(/Usage|USAGE/, shell_output("#{bin}/actioneer --help"))
  end
end
