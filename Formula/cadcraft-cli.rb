class CadcraftCli < Formula
  desc "AutoCAD-style 2D/3D CAD application (Rust + egui)."
  homepage "https://github.com/storytold/cadcraft"
  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/cadcraft/releases/download/v#{version}/cadcraft-cli-0.5.0-macos-universal.zip"
    sha256 "8834cf6fce05e62f0533915aec48241db9b89f30e3e2821c77bba5476b0e9053"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/cadcraft/releases/download/v#{version}/cadcraft-0.5.0-linux-aarch64.tar.gz"
      sha256 "15f5047c1edce4b28f54c00cf5aae256b8fcc0bdd617e4dec88a1c54b26cefa8"
    else
      url "https://github.com/storytold/cadcraft/releases/download/v#{version}/cadcraft-0.5.0-linux-x86_64.tar.gz"
      sha256 "036c3b401987b6a9991b5fc7ba097d5b717e8d18522f7c3f626b0f6a363e208e"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to cadcraft-cli-0.5.0-macos-universal/; install just the binary.
      bin.install "cadcraft-cli-0.5.0-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "cadcraft-0.5.0-linux-aarch64/bin/#{name}"
    else
      bin.install "cadcraft-0.5.0-linux-x86_64/bin/#{name}"
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
