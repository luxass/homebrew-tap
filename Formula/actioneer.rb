class Actioneer < Formula
  desc "CLI tool for GitHub Actions workflows"
  homepage "https://github.com/luxass/actioneer"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1111111111111111111111111111111111111111111111111111111111111111" # sha-update-id: actioneer-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2222222222222222222222222222222222222222222222222222222222222222" # sha-update-id: actioneer-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3333333333333333333333333333333333333333333333333333333333333333" # sha-update-id: actioneer-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4444444444444444444444444444444444444444444444444444444444444444" # sha-update-id: actioneer-x86_64-unknown-linux-gnu
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
