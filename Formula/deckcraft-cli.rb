class DeckcraftCli < Formula
  desc "PowerPoint-style presentation builder (Rust + egui)."
  homepage "https://github.com/storytold/deckcraft"
  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/deckcraft/releases/download/v#{version}/deckcraft-cli-0.5.0-macos-universal.zip"
    sha256 "e4f8562c4c56337d2ae4069d182e2e325ddbf700b6248272d96f3e469702990b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/deckcraft/releases/download/v#{version}/deckcraft-0.5.0-linux-aarch64.tar.gz"
      sha256 "9fb43aedb9b223cf62f34d2b50900c6337a7cd5cb3178b9b530bb93a213c402d"
    else
      url "https://github.com/storytold/deckcraft/releases/download/v#{version}/deckcraft-0.5.0-linux-x86_64.tar.gz"
      sha256 "c2648c6071f631ecc6639ce6b7d60f68eed83ddeaba6b1559b07c5046863117c"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to deckcraft-cli-0.5.0-macos-universal/; install just the binary.
      bin.install "deckcraft-cli-0.5.0-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "deckcraft-0.5.0-linux-aarch64/bin/#{name}"
    else
      bin.install "deckcraft-0.5.0-linux-x86_64/bin/#{name}"
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
