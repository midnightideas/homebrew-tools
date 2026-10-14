cask "designcraft" do
  version "0.7.1"

  on_macos do
    url "https://github.com/storytold/designcraft/releases/download/v0.7.1/designcraft-0.7.1-macos-universal.dmg"
    sha256 "c8520b8fa702e19436c06269792e68a3ca09a629c6d5cb59193355ef3e89ec52"
    app "Designcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/designcraft/releases/download/v0.7.1/designcraft-0.7.1-linux-aarch64.AppImage"
      sha256 "6aa239aef20a856ed81f16b976e5c3a22076ff6407ede4a0dae35fb616e3b6ce"
    else
      url "https://github.com/storytold/designcraft/releases/download/v0.7.1/designcraft-0.7.1-linux-x86_64.AppImage"
      sha256 "4fbb5d2d2c2f1d67fb7e131e54a8545310c489258ca5a2d5509a7a2c5d3fa59b"
    end
  end

  name "Designcraft"
  desc "InDesign-style page layout application (Rust + egui)."
  homepage "https://github.com/storytold/designcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/designcraft",
    "~/.local/share/designcraft",
    "~/.cache/designcraft",
  ]
end
