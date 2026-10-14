class PdfcraftCli < Formula
  desc "Acrobat-style PDF viewer and editor (CLI)."
  homepage "https://github.com/storytold/pdfcraft"
  name "PdfCraft CLI"
  version "0.7.1"

  on_macos do
    url "https://github.com/storytold/pdfcraft/releases/download/v0.7.1/pdfcraft-cli-0.7.1-macos-universal.zip"
    sha256 "6631b868e65aa9eceabf416096a26681f80ca66a7eae53cca82d3239a847aa63"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/pdfcraft/releases/download/v0.7.1/pdfcraft-0.7.1-linux-aarch64.tar.gz"
      sha256 "77baad6346e6d0087872fcb6f6f64e6bdb7f8401658ac96119d462aa1d7ae4e0"
    else
      url "https://github.com/storytold/pdfcraft/releases/download/v0.7.1/pdfcraft-0.7.1-linux-x86_64.tar.gz"
      sha256 "bc7d651511273720f6a5ccbe0dd5b2c4ddccb6c576a0aff619f39d2c5667a315"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to pdfcraft-cli-0.7.1-macos-universal/; install just the binary.
      bin.install "pdfcraft-cli-0.7.1-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "pdfcraft-0.7.1-linux-aarch64/bin/#{name}"
    else
      bin.install "pdfcraft-0.7.1-linux-x86_64/bin/#{name}"
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
