class ArtifacthubMcp < Formula
  desc "MCP server for Artifact Hub"
  homepage "https://github.com/luxass/artifacthub-rs"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/artifacthub-mcp-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "81d9fab6b54f0d02585a46775c01a272864a8a0b4da9eb5c774048267a36b9b3" # sha-update-id: artifacthub-mcp-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/artifacthub-mcp-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bf7812649219679b5eab1f947da58c51cf3c00cc346e64a7c67f247bd43d5f26" # sha-update-id: artifacthub-mcp-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/artifacthub-mcp-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "78c3d5ed9c46e8d95bf977e5005e85e4f0a9d8754d9b543a097e8c35697f7b02" # sha-update-id: artifacthub-mcp-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/v#{version}/artifacthub-mcp-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "933578f946124a0ac709c6dc093d17772b55829fd865d6ab1772814328d0ffdf" # sha-update-id: artifacthub-mcp-x86_64-unknown-linux-gnu
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
