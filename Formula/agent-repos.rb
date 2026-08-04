class AgentRepos < Formula
  desc "Maintain pinned clones of reference repositories for coding agents"
  homepage "https://github.com/luxass/agent-repos"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c4b05b0aac92fb825f2c1a8732c1cb77796d3037d549a04da4b802b850d6c98f" # sha-update-id: agent-repos-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "35d0e9e99f0b11a3c70ffc8000cdf10a7761f3428d3cea4a2b586a3a6598ce87" # sha-update-id: agent-repos-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "13f74c42d9f9b6e2d57f8f245ad73eaa77526e0b81fac94a5d94cca1b20b9365" # sha-update-id: agent-repos-aarch64-unknown-linux-musl
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5327cd3be31a7b49dfd33ecb7af7ebc67c086605418603e9670f6b0fd38937a1" # sha-update-id: agent-repos-x86_64-unknown-linux-musl
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
