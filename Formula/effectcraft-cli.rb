class EffectcraftCli < Formula
  desc "After Effects-style motion graphics and compositing (CLI)."
  homepage "https://github.com/storytold/effectcraft"
  name "EffectCraft CLI"
  version "0.9.2"

  on_macos do
    url "https://github.com/storytold/effectcraft/releases/download/v0.9.2/effectcraft-cli-0.9.2-macos-universal.zip"
    sha256 "957c39106f18d6bf4fc0a8b2ab8a084e334b183992390347a09dc04869dfd505"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/effectcraft/releases/download/v0.9.2/effectcraft-0.9.2-linux-aarch64.tar.gz"
      sha256 "3efab284d4f06380a0f36d9e8d21cafc9a05e505607cdacb8beb6d37b932d160"
    else
      url "https://github.com/storytold/effectcraft/releases/download/v0.9.2/effectcraft-0.9.2-linux-x86_64.tar.gz"
      sha256 "916d35d7dc0fd5650b57f576e6556256d05dedf93e83a9740c1892319bb4ac1c"
    end
  end

  def install
    if OS.mac?
      # macOS zip extracts to effectcraft-cli-0.9.2-macos-universal/; install just the binary.
      bin.install "effectcraft-cli-0.9.2-macos-universal/#{name}"
    elsif Hardware::CPU.arm?
      bin.install "effectcraft-0.9.2-linux-aarch64/bin/#{name}"
    else
      bin.install "effectcraft-0.9.2-linux-x86_64/bin/#{name}"
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
