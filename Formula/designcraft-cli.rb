class DesigncraftCli < Formula
  desc "InDesign-style page layout application (CLI)."
  homepage "https://github.com/storytold/designcraft"
  version "0.7.1"

  on_macos do
    url "https://github.com/storytold/designcraft/releases/download/v0.7.1/designcraft-cli-0.7.1-macos-universal.zip"
    sha256 "bd7208a3947b185d1d889ebc1885650b13085e9df2b974e135bfca2a7175e704"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/designcraft/releases/download/v0.7.1/designcraft-0.7.1-linux-aarch64.tar.gz"
      sha256 "665c2736ad0841b8a917b4f5b761a1ad104a7196fcaf5d2d5608df0dd876d820"
    else
      url "https://github.com/storytold/designcraft/releases/download/v0.7.1/designcraft-0.7.1-linux-x86_64.tar.gz"
      sha256 "05a2b2531f6f26746b4a743081fd00f9ea77822fa178663802a0eaeced6c1437"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to designcraft-cli-0.7.1-macos-universal/; install just the binary.
      bin.install "designcraft-cli-0.7.1-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "designcraft-0.7.1-linux-aarch64/bin/#{name}"
    else
      bin.install "designcraft-0.7.1-linux-x86_64/bin/#{name}"
    end
  end

  test do
    assert_predicate bin/"#{name}", :exist?
  end

  livecheck do
    url :url
    strategy :github_latest
  end
end
