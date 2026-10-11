class LightcraftCli < Formula
  desc "Lightroom-style photo library and raw development (Rust + egui)."
  homepage "https://github.com/storytold/lightcraft"
  version "0.6.0"

  on_macos do
    url "https://github.com/storytold/lightcraft/releases/download/v#{version}/lightcraft-cli-0.6.0-macos-universal.zip"
    sha256 "e87014d49d4dbf00851f5ff3005ecd0d5418ccd77af4f72aa750374e3f4803ce"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/lightcraft/releases/download/v#{version}/lightcraft-0.6.0-linux-aarch64.tar.gz"
      sha256 "504525085424ac78675ac195e9fc4c4e73a01deb034da491d8b0e3326c3b31a4"
    else
      url "https://github.com/storytold/lightcraft/releases/download/v#{version}/lightcraft-0.6.0-linux-x86_64.tar.gz"
      sha256 "d738f16b3a717b1e66716981aa4f8dbd68caa5bf9d04d175801a2278f18f69f1"
    end
  end

  def install
    if OS.mac?
      # The macOS zip extracts to <name>-<version>-macos-universal/<name>;
      # install just the binary into HOMEBREW_PREFIX/bin.
      bin.install "#{name}-#{version}-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "lightcraft-#{version}-linux-aarch64/bin/#{name}"
    else
      bin.install "lightcraft-#{version}-linux-x86_64/bin/#{name}"
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
