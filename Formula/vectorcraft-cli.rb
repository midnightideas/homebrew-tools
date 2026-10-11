class VectorcraftCli < Formula
  desc "Illustrator-style vector editor (Rust + egui)."
  homepage "https://github.com/storytold/vectorcraft"
  version "0.9.0"

  on_macos do
    url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-cli-0.9.0-macos-universal.zip"
    sha256 "0e6fc38dd1ec432fb4a133ee1b1efe935d739f0fcb376b1925ee89473d55a61b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-0.9.0-linux-aarch64.tar.gz"
      sha256 "5c1fd3b5f50943be384c3e682ef1c573004059af50d6a8066981a1caffea8c43"
    else
      url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-0.9.0-linux-x86_64.tar.gz"
      sha256 "afbc4a0904740dfd1208e717664eb294965055e74c227c2ac3dc53af502e46a4"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to vectorcraft-cli-0.9.0-macos-universal/; install just the binary.
      bin.install "vectorcraft-cli-0.9.0-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "vectorcraft-0.9.0-linux-aarch64/bin/#{name}"
    else
      bin.install "vectorcraft-0.9.0-linux-x86_64/bin/#{name}"
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
