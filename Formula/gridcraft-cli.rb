class GridcraftCli < Formula
  desc "Excel-style spreadsheet application (CLI)."
  homepage "https://github.com/storytold/gridcraft"
  name "GridCraft CLI"
  version "0.6.1"

  on_macos do
    url "https://github.com/storytold/gridcraft/releases/download/v0.6.1/gridcraft-cli-0.6.1-macos-universal.zip"
    sha256 "9995ed7f132a596a456591faef825e304e69596488422d777275e03af38d5fca"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/gridcraft/releases/download/v0.6.1/gridcraft-0.6.1-linux-aarch64.tar.gz"
      sha256 "ec8e2c43653d24382f59cb167643b487b2d5063cb21efa0ad1ef25ebe24a500a"
    else
      url "https://github.com/storytold/gridcraft/releases/download/v0.6.1/gridcraft-0.6.1-linux-x86_64.tar.gz"
      sha256 "61163b62d9faf814b864e1b255d15dc310a71a72ca03d8791fa8024420162745"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to gridcraft-cli-0.6.1-macos-universal/; install just the binary.
      bin.install "gridcraft-cli-0.6.1-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "gridcraft-0.6.1-linux-aarch64/bin/#{name}"
    else
      bin.install "gridcraft-0.6.1-linux-x86_64/bin/#{name}"
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
