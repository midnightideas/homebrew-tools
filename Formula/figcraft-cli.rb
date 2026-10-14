class FigcraftCli < Formula
  desc "Figma-style collaborative design and prototyping tool (CLI)."
  homepage "https://github.com/storytold/figcraft"
  name "FigCraft CLI"
  version "0.5.1"

  on_macos do
    url "https://github.com/storytold/figcraft/releases/download/v0.5.1/figcraft-cli-0.5.1-macos-universal.zip"
    sha256 "46b106a748364f59953504c22f9ac3915844757b126e911c1bcfff71aa60aa84"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/figcraft/releases/download/v0.5.1/figcraft-0.5.1-linux-aarch64.tar.gz"
      sha256 "7a672cf9a8c356dff6b2943bd3d67eb4ad65dbcf866acf845741b17cd7191d8c"
    else
      url "https://github.com/storytold/figcraft/releases/download/v0.5.1/figcraft-0.5.1-linux-x86_64.tar.gz"
      sha256 "8ae2b6a9fb0d814df716cbb05226582de741394bc6326ea2b8462544545ffc16"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to figcraft-cli-0.5.1-macos-universal/; install just the binary.
      bin.install "figcraft-cli-0.5.1-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "figcraft-0.5.1-linux-aarch64/bin/#{name}"
    else
      bin.install "figcraft-0.5.1-linux-x86_64/bin/#{name}"
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
