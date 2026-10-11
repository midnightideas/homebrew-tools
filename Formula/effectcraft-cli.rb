class EffectcraftCli < Formula
  desc "After Effects-style motion graphics and compositing (Rust + egui)."
  homepage "https://github.com/storytold/effectcraft"
  version "0.8.0"

  on_macos do
    url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-cli-0.8.0-macos-universal.zip"
    sha256 "a8b133b53f29c967690295cd6652dc894257b132424ee68b680bd09908aa3553"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-0.8.0-linux-aarch64.tar.gz"
      sha256 "67783fe65532879e13aeba440a8b0f260b0fbdc9b36e991181720bda67aeb27e"
    else
      url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-0.8.0-linux-x86_64.tar.gz"
      sha256 "725c88cf379122d70f941dd3edacb54479d63ff1e2a00fae318eaee02ad762c4"
    end
  end

  def install
    if OS.mac?
      # The macOS zip extracts to <name>-<version>-macos-universal/<name>;
      # install just the binary into HOMEBREW_PREFIX/bin.
      bin.install "#{name}-#{version}-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "effectcraft-#{version}-linux-aarch64/bin/#{name}"
    else
      bin.install "effectcraft-#{version}-linux-x86_64/bin/#{name}"
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
