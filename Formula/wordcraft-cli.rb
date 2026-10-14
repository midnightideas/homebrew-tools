class WordcraftCli < Formula
  desc "Word-style word processor CLI for .docx files"
  homepage "https://github.com/storytold/wordcraft"
  name "WordCraft CLI"
  version "0.6.1"

  on_macos do
    url "https://github.com/storytold/wordcraft/releases/download/v0.6.1/wordcraft-cli-0.6.1-macos-universal.zip"
    sha256 "58840293e40f845b56be90eef53169213c95d841cc078b94a78a225e4eff59e6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/wordcraft/releases/download/v0.6.1/wordcraft-0.6.1-linux-aarch64.AppImage"
      sha256 "78edd2b884fee4cfcfe8a072c4f1608759882e524f73c74c92dbc21612db860e"
    else
      url "https://github.com/storytold/wordcraft/releases/download/v0.6.1/wordcraft-0.6.1-linux-x86_64.tar.gz"
      sha256 "79bd54c81276f6ea551222432adec15e0eaab4cb5881decee38eafd7a5ca38f9"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to wordcraft-cli-0.6.1-macos-universal/; install just the binary.
      bin.install "wordcraft-cli-0.6.1-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "wordcraft-0.6.1-linux-aarch64.AppImage/bin/#{name}"
    else
      bin.install "wordcraft-0.6.1-linux-x86_64/bin/#{name}"
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
