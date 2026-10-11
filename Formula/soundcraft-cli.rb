class SoundcraftCli < Formula
  desc "Pro Tools-style digital audio workstation (Rust + egui)."
  homepage "https://github.com/storytold/soundcraft"
  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/soundcraft/releases/download/v#{version}/soundcraft-cli-0.5.0-macos-universal.zip"
    sha256 "b02f3edf649b3ee2ac499f14965f0e8f229329fd49806d6eea64895022ea8187"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/soundcraft/releases/download/v#{version}/soundcraft-0.5.0-linux-aarch64.tar.gz"
      sha256 "144aacd81c4940a4c379cf2f0b68ef067aa63cc329411cdacfb5b9e502ab2b69"
    else
      url "https://github.com/storytold/soundcraft/releases/download/v#{version}/soundcraft-0.5.0-linux-x86_64.tar.gz"
      sha256 "b1305b1a7ba7b8563204084dc0de652ef4236769ccf46a5e7f545a4a1060e803"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to soundcraft-cli-0.5.0-macos-universal/; install just the binary.
      bin.install "soundcraft-cli-0.5.0-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "soundcraft-0.5.0-linux-aarch64/bin/#{name}"
    else
      bin.install "soundcraft-0.5.0-linux-x86_64/bin/#{name}"
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
