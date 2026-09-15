class ArtifacthubMcp < Formula
  desc "MCP server for Artifact Hub"
  homepage "https://github.com/luxass/artifacthub-rs"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "efd429f5de0f4c8c8723e2069d3c0e9e6e1650b65e315e8128d2b0b8359ea964" # sha-update-id: artifacthub-mcp-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0b664f5f48794daa57e6f8b596fa8cc2b1968db983a1cc45a9c9ec466d4160a4" # sha-update-id: artifacthub-mcp-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "52c077845bfcda1b3adf5786b6918a569247b82b7b1a9c8c1912600ee6fdf3dd" # sha-update-id: artifacthub-mcp-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/artifacthub-mcp%40#{version}/artifacthub-mcp-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a3024956c739f7e9e4c961e8122e35c42130d57d966e270e9bab8273f83060e" # sha-update-id: artifacthub-mcp-x86_64-unknown-linux-gnu
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
