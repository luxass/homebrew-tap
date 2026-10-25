class AgentRepos < Formula
  desc "Maintain pinned clones of reference repositories for coding agents"
  homepage "https://github.com/luxass/agent-repos"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "29185a010e2d6e0ad2506515ea9dcf0e38a73213300a689134c3651a249da309" # sha-update-id: agent-repos-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "11b4a52600e2e160b77cb8c83c2d7fa6374dd8d04b1c7770d80c50231182b584" # sha-update-id: agent-repos-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "67197b1cf90238d74028580073dbb74960775e2d6e04af431bedf794ba0c9fa8" # sha-update-id: agent-repos-aarch64-unknown-linux-musl
    else
      url "#{homepage}/releases/download/v#{version}/agent-repos-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2730bcd7b087f2a8c0b5a8cd6ec181896d4f8719cfcc552f4d35fb0dde1b7a7f" # sha-update-id: agent-repos-x86_64-unknown-linux-musl
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
