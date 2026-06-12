class Actioneer < Formula
  desc "CLI tool for GitHub Actions workflows"
  homepage "https://github.com/luxass/actioneer"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b9e4863fce29af6b45e2caa554b2395c61bd5868159528a253f4268d5fe83bad" # sha-update-id: actioneer-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4e5c20c830761b89ebcb9bf1bbc290b2fe4a61497da5c64fe0695529dd922c5c" # sha-update-id: actioneer-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6fa7c821c5ef9f1be3640fbe8681a18b5f612b1957ff8dec2f259035412ae41" # sha-update-id: actioneer-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ccc0dc5776dd91add8aa322a693d188687b43f5e336558cc8f1e284d232cc77" # sha-update-id: actioneer-x86_64-unknown-linux-gnu
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
