class DesigncraftCli < Formula
  desc "InDesign-style page layout application (Rust + egui)."
  homepage "https://github.com/storytold/designcraft"
  version "0.6.0"

  on_macos do
    url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-cli-0.6.0-macos-universal.zip"
    sha256 "bd5c43d876e51356b42360c942d35590898fc3083f367ff33c2d7c60a207ebca"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-0.6.0-linux-aarch64.tar.gz"
      sha256 "9fd4a056aea68e80fc705098d96033e0c6768e8ffb9cb9b3d0f738d5a0efeeb5"
    else
      url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-0.6.0-linux-x86_64.tar.gz"
      sha256 "abb661cd2fc53677d040fe0be3f241bbb8c0fad9619192a83109d53bd514bfb9"
    end
  end

  def install
    if OS.mac?
      # The macOS zip extracts to <name>-<version>-macos-universal/<name>;
      # install just the binary into HOMEBREW_PREFIX/bin.
      bin.install "#{name}-#{version}-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "designcraft-#{version}-linux-aarch64/bin/#{name}"
    else
      bin.install "designcraft-#{version}-linux-x86_64/bin/#{name}"
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
