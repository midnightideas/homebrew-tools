class GridcraftCli < Formula
  desc "Excel-style spreadsheet application (Rust + egui)."
  homepage "https://github.com/storytold/gridcraft"
  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/gridcraft/releases/download/v#{version}/gridcraft-cli-0.5.0-macos-universal.zip"
    sha256 "4559b42d96bafcbc4180cc7f09d5f428597ec19d447c3df2e4b458afcb4c04fc"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/gridcraft/releases/download/v#{version}/gridcraft-0.5.0-linux-aarch64.tar.gz"
      sha256 "d5f3a0ca8a4fbd873740bf123451555356ca8310f0fd667072998dbcf73a268f"
    else
      url "https://github.com/storytold/gridcraft/releases/download/v#{version}/gridcraft-0.5.0-linux-x86_64.tar.gz"
      sha256 "e6505c2f929f9854c350a0df26189c4e56c8adf87cc61625f80d6a8eec2b628d"
    end
  end

  def install
    if OS.mac?
      # The macOS zip extracts to <name>-<version>-macos-universal/<name>;
      # install just the binary into HOMEBREW_PREFIX/bin.
      bin.install "#{name}-#{version}-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "gridcraft-#{version}-linux-aarch64/bin/#{name}"
    else
      bin.install "gridcraft-#{version}-linux-x86_64/bin/#{name}"
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
