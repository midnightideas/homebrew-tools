class FilmcraftCli < Formula
  desc "Premiere-style non-linear video editor (Rust + egui)."
  homepage "https://github.com/storytold/filmcraft"
  version "0.6.0"

  on_macos do
    url "https://github.com/storytold/filmcraft/releases/download/v#{version}/filmcraft-cli-0.6.0-macos-universal.zip"
    sha256 "7ede2aa3e8994ca8363618ef649526546cf951b11a8eaf895b9471101cf5bd32"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/filmcraft/releases/download/v#{version}/filmcraft-0.6.0-linux-aarch64.tar.gz"
      sha256 "aa0ad54469e1c257b6bfb6753f75e82990cdf28afd9da9542e541a54c1d58dbf"
    else
      url "https://github.com/storytold/filmcraft/releases/download/v#{version}/filmcraft-0.6.0-linux-x86_64.tar.gz"
      sha256 "b3d706d599699ead76b46a29d5697287b9f75a0bc9eb40f7733db7657dae8204"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to filmcraft-cli-0.6.0-macos-universal/; install just the binary.
      bin.install "filmcraft-cli-0.6.0-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "filmcraft-0.6.0-linux-aarch64/bin/#{name}"
    else
      bin.install "filmcraft-0.6.0-linux-x86_64/bin/#{name}"
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
