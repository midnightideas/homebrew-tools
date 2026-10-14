class SoundcraftCli < Formula
  desc "Pro Tools-style digital audio workstation (CLI)."
  homepage "https://github.com/storytold/soundcraft"
  name "SoundCraft CLI"
  version "0.6.1"

  on_macos do
    url "https://github.com/storytold/soundcraft/releases/download/v0.6.1/soundcraft-cli-0.6.1-macos-universal.zip"
    sha256 "bcc363a3f7799e3636494d0c9938a403428fa6372798341938f460a022c25c4f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/soundcraft/releases/download/v0.6.1/soundcraft-0.6.1-linux-aarch64.tar.gz"
      sha256 "55a18458670f1723edc8ba45da01f3dd8b85feba7cc3f83d44e7038120245ca4"
    else
      url "https://github.com/storytold/soundcraft/releases/download/v0.6.1/soundcraft-0.6.1-linux-x86_64.tar.gz"
      sha256 "f3bfa3735146e4d7b12cd8363b8fe77bbeff31ee95392295033f50b1916efcee"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to soundcraft-cli-0.6.1-macos-universal/; install just the binary.
      bin.install "soundcraft-cli-0.6.1-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "soundcraft-0.6.1-linux-aarch64/bin/#{name}"
    else
      bin.install "soundcraft-0.6.1-linux-x86_64/bin/#{name}"
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
