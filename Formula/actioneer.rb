class Actioneer < Formula
  desc "CLI tool for GitHub Actions workflows"
  homepage "https://github.com/luxass/actioneer"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c309a8fed9438d0b0176f85272e6030186a5ca578934346df3bfc850bbc4a60f" # sha-update-id: actioneer-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f396ee9a7a832776a4ee7b694d5886b0bacce421ea3aa880007b842fbcb7857e" # sha-update-id: actioneer-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ee99038cf31cf2ff192b574aa0070b0013a7b5c97285347ace6edb67017b4cf" # sha-update-id: actioneer-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09e5fe303eae6fa57f0cb58b0127222879ed3f82a7f0d723cf36cdbd8d51bb31" # sha-update-id: actioneer-x86_64-unknown-linux-gnu
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
