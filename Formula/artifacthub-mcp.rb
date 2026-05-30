class ArtifacthubMcp < Formula
  desc "MCP server for Artifact Hub"
  homepage "https://github.com/luxass/artifacthub-rs"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e45221c37a4bff13131c13e9d282ca0a307e11094b7576b3759b34af645e16cd" # sha-update-id: artifacthub-mcp-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "92e9d821e522c40b7f119a2f68cf7898d9b8b5ed600e96eea0f6f5b60cd5b439" # sha-update-id: artifacthub-mcp-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da7c456537eda86518f6789280c5dbc302219f73c8460d1bc99f577a2c2fb30d" # sha-update-id: artifacthub-mcp-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b477777fac90b9f6b6798c127f1ca1681c6ae6e1c0fb0786540da90d7edf172" # sha-update-id: artifacthub-mcp-x86_64-unknown-linux-gnu
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
