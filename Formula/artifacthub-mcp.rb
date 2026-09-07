class ArtifacthubMcp < Formula
  desc "MCP server for Artifact Hub"
  homepage "https://github.com/luxass/artifacthub-rs"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4e965fa799a5049429f42e9aa0ce56bb75275f26ae743766b7db5709579ace8a" # sha-update-id: artifacthub-mcp-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7176700eb2e887599bdbbae8cf75e768f5df7e5ff6630acc3551abbe583a1b65" # sha-update-id: artifacthub-mcp-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ac4220d2c808a5da6a642089da768069a6845845e8e550cea26042a2aae487e" # sha-update-id: artifacthub-mcp-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "553fd96e111e295a05a8bd0b31270b028ab7f66505ca02ddbf49680a9fc81908" # sha-update-id: artifacthub-mcp-x86_64-unknown-linux-gnu
    end
  end

  def install
    binary = Dir["**/artifacthub-mcp"].find { |path| File.file?(path) && File.executable?(path) }
    odie "artifacthub-mcp binary not found in release archive" if binary.nil?

    bin.install binary => "artifacthub-mcp"
  end

  test do
    assert_match(/Usage|USAGE/, shell_output("#{bin}/artifacthub-mcp --help"))
  end
end
