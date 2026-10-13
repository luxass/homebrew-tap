class AgentRepos < Formula
  desc "Maintain pinned clones of reference repositories for coding agents"
  homepage "https://github.com/luxass/agent-repos"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ace5b9dd9de614088d43c8eea9fdf798ffa7556f6fd909ff031906cba1776b28" # sha-update-id: agent-repos-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5e6139c31d72c993e80c26b08a7c97767789cdb8a3c0167ee18d0d87121e1a51" # sha-update-id: agent-repos-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a9739818dd6f3313579c6fdb558775e55d3d47eba8636b172a7930eaf7a01d33" # sha-update-id: agent-repos-aarch64-unknown-linux-musl
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "df4209ec01fd9393e7f9cdf1ce6235ea6d51665aed448a39c24ae29567e60760" # sha-update-id: agent-repos-x86_64-unknown-linux-musl
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
