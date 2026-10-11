class WordcraftCli < Formula
  desc "Word-style word processor for .docx files (Rust + egui)."
  homepage "https://github.com/storytold/wordcraft"
  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/wordcraft/releases/download/v#{version}/wordcraft-cli-0.5.0-macos-universal.zip"
    sha256 "9ded04712fad32c955b32c4efccbe4468fd95eae4f18ea3e32dd3355e6674b5b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/wordcraft/releases/download/v#{version}/wordcraft-0.5.0-linux-aarch64.tar.gz"
      sha256 "c14496d00b7f9a4bf658453a5f9eacc69141dcc49f2631035fd984cefc90cbf3"
    else
      url "https://github.com/storytold/wordcraft/releases/download/v#{version}/wordcraft-0.5.0-linux-x86_64.tar.gz"
      sha256 "994bb376479ef6d76735cf4029e5ef3c2d52a85a4c9acde2b37c33b19c570203"
    end
  end

  def install
    if OS.mac?
      # The macOS zip extracts to <name>-<version>-macos-universal/<name>;
      # install just the binary into HOMEBREW_PREFIX/bin.
      bin.install "#{name}-#{version}-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "wordcraft-#{version}-linux-aarch64/bin/#{name}"
    else
      bin.install "wordcraft-#{version}-linux-x86_64/bin/#{name}"
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
