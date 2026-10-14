cask "vectorcraft" do
  version "0.10.0"

  on_macos do
    url "https://github.com/storytold/vectorcraft/releases/download/v0.10.0/vectorcraft-0.10.0-macos-universal.dmg"
    sha256 "c0e6d3de60d9c4217830f65e136a6a8f9381881c2525dae0558292cd36352e29"
    app "VectorCraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/vectorcraft/releases/download/v0.10.0/vectorcraft-0.10.0-linux-aarch64.AppImage"
      sha256 "65cc3c24bd2152c14756a9cecb14f67c198b32fdae07640f5127cb89271840f7"
    else
      url "https://github.com/storytold/vectorcraft/releases/download/v0.10.0/vectorcraft-0.10.0-linux-x86_64.AppImage"
      sha256 "2d2d89587014465c3096a6e456d73a73bb6aec104ec0ed213a406a148026c029"
    end
  end

  name "VectorCraft"
  desc "Illustrator-style vector editor (Rust + egui)."
  homepage "https://github.com/storytold/vectorcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/vectorcraft",
    "~/.local/share/vectorcraft",
    "~/.cache/vectorcraft",
  ]
end
