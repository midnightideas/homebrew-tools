class PdfcraftCli < Formula
  desc "Acrobat-style PDF viewer and editor (Rust + egui)."
  homepage "https://github.com/storytold/pdfcraft"
  version "0.6.0"

  on_macos do
    url "https://github.com/storytold/pdfcraft/releases/download/v#{version}/pdfcraft-cli-0.6.0-macos-universal.zip"
    sha256 "85bf80b0732f2556f3133e25693d1f1dfdd2683cd6236aa154bb19f73515b7cf"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/pdfcraft/releases/download/v#{version}/pdfcraft-0.6.0-linux-aarch64.tar.gz"
      sha256 "20fb5175db5c992355b6f1c73cc5b163be05d2f4f270afef6a184bbae3b38a59"
    else
      url "https://github.com/storytold/pdfcraft/releases/download/v#{version}/pdfcraft-0.6.0-linux-x86_64.tar.gz"
      sha256 "9a136e71e37b459ed5746dbe19a364ce84cf5d995c6f6c98af6147d818390a53"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to pdfcraft-cli-0.6.0-macos-universal/; install just the binary.
      bin.install "pdfcraft-cli-0.6.0-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "pdfcraft-0.6.0-linux-aarch64/bin/#{name}"
    else
      bin.install "pdfcraft-0.6.0-linux-x86_64/bin/#{name}"
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
