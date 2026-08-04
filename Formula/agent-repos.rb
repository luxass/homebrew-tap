class AgentRepos < Formula
  desc "Maintain pinned clones of reference repositories for coding agents"
  homepage "https://github.com/luxass/agent-repos"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # sha-update-id: agent-repos-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # sha-update-id: agent-repos-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # sha-update-id: agent-repos-aarch64-unknown-linux-musl
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # sha-update-id: agent-repos-x86_64-unknown-linux-musl
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
