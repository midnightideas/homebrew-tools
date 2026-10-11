class PhotocraftCli < Formula
  desc "Photoshop-style raster image editor (Rust + wgpu + egui)."
  homepage "https://github.com/storytold/photocraft"
  version "0.7.0"

  on_macos do
    url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-cli-0.7.0-macos-universal.zip"
    sha256 "caf41eee1827ef740bc4495fb1fee77f6a4e0be82fb131106ad06cd591fd8091"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-0.7.0-linux-aarch64.tar.gz"
      sha256 "8540eb1db80cad4a5a57ce54a0c866116daa003612a442e94382c422a0b2fda9"
    else
      url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-0.7.0-linux-x86_64.tar.gz"
      sha256 "641f831252fd31b43ee1a12e572d7442e5652c2e5bf623de085741c370f0c91d"
    end
  end

  def install
    if OS.mac?
      # The macOS zip extracts to <name>-<version>-macos-universal/<name>;
      # install just the binary into HOMEBREW_PREFIX/bin.
      bin.install "#{name}-#{version}-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "photocraft-#{version}-linux-aarch64/bin/#{name}"
    else
      bin.install "photocraft-#{version}-linux-x86_64/bin/#{name}"
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
