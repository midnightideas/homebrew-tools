class VectorcraftCli < Formula
  desc "Illustrator-style vector editor (CLI)."
  homepage "https://github.com/storytold/vectorcraft"
  version "0.10.0"

  on_macos do
    url "https://github.com/storytold/vectorcraft/releases/download/v0.10.0/vectorcraft-cli-0.10.0-macos-universal.zip"
    sha256 "0744d0d606747eaf521e6529d02477f07ca6d04fb64c7c03247aab0dd4c19968"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/vectorcraft/releases/download/v0.10.0/vectorcraft-0.10.0-linux-aarch64.tar.gz"
      sha256 "1ab5a2739c4f06d27538914c86839f6a78582f94aed7c411caa1988fe22b8a6b"
    else
      url "https://github.com/storytold/vectorcraft/releases/download/v0.10.0/vectorcraft-0.10.0-linux-x86_64.tar.gz"
      sha256 "a55735a192877038c9b4c3069504f7a73a05433a48edddd8e94fc7d2995aa6fc"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to vectorcraft-cli-0.10.0-macos-universal/; install just the binary.
      bin.install "vectorcraft-cli-0.10.0-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "vectorcraft-0.10.0-linux-aarch64/bin/#{name}"
    else
      bin.install "vectorcraft-0.10.0-linux-x86_64/bin/#{name}"
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
