class ArtifacthubMcp < Formula
  desc "MCP server for Artifact Hub"
  homepage "https://github.com/luxass/artifacthub-mcp"
  version "artifacthub-mcp@0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/artifacthub-mcp-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "194e90243f6bdc4e487cacb313e4dbd61e2c3885a158560e4922361414377387" # sha-update-id: artifacthub-mcp-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/artifacthub-mcp-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d03cb7a9ca23905f8a3172aa6678f0080e7e322d15681f4ded199dee7c8c8eda" # sha-update-id: artifacthub-mcp-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/artifacthub-mcp-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d8ce5f5d09b9e3242517be4e801976d2fe2c5a74b19d8b5528d6a7c9e6bd33a" # sha-update-id: artifacthub-mcp-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/v#{version}/artifacthub-mcp-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43581eccb4a16182643e1e649f3f8b6ad25ad7e0305b91ab0643a13e6d887be7" # sha-update-id: artifacthub-mcp-x86_64-unknown-linux-gnu
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
