class Actioneer < Formula
  desc "CLI tool for GitHub Actions workflows"
  homepage "https://github.com/luxass/actioneer"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9e5562e7fbea8f7d4847f775be69e91e0f8c83fdc7a0a70f74a2cb3e7d913b69" # sha-update-id: actioneer-aarch64-apple-darwin
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "301f54fe499d221b8e29627b04f014ba1bb171ac1c2e92c19625b4c1224a8f75" # sha-update-id: actioneer-x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "92a7acc5bc55b440fa4808a78fb364d36d65b6c6742396dd3fd946c07e210f76" # sha-update-id: actioneer-aarch64-unknown-linux-gnu
    else
      url "#{homepage}/releases/download/v#{version}/actioneer-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "86d9f218413339e285e195f688f26ebc26b8f4d55adcd152249274734b9d1d5e" # sha-update-id: actioneer-x86_64-unknown-linux-gnu
    end
  end

  def install
    binary = Dir["**/actioneer"].find { |path| File.file?(path) && File.executable?(path) }
    odie "actioneer binary not found in release archive" if binary.nil?

    bin.install binary => "actioneer"
  end

  test do
    assert_match(/Usage|USAGE/, shell_output("#{bin}/actioneer --help"))
  end
end
