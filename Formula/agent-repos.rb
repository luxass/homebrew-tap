class AgentRepos < Formula
  desc "Maintain pinned clones of reference repositories for coding agents"
  homepage "https://github.com/luxass/agent-repos"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1562145fc9f247a696dadc2fae5adf832fca1f320f9326dbd878445039bc842a" # sha-update-id: agent-repos-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0b7f86aaacfd77e3c606cb2949b3b698686dd8fff1fb0dccfad7b350fd270fb4" # sha-update-id: agent-repos-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "84d145394bc1dde62b628c03e95936560bdf18932fa86579c323a7d372be2768" # sha-update-id: agent-repos-aarch64-unknown-linux-musl
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3572f4955a2a582f916f25c0a636cb713ea7f8b69837434f67b919da651558a3" # sha-update-id: agent-repos-x86_64-unknown-linux-musl
    end
  end

  def install
    binary = Dir["**/agent-repos"].find { |path| File.file?(path) && File.executable?(path) }
    odie "agent-repos binary not found in release archive" if binary.nil?

    bin.install binary => "agent-repos"
  end

  test do
    assert_match(/Usage|USAGE/, shell_output("#{bin}/agent-repos --help"))
  end
end
