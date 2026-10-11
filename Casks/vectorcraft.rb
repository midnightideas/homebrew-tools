cask "vectorcraft" do
  version "0.9.0"

  on_macos do
    url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-0.9.0-macos-universal.dmg"
    sha256 "ac37cdff79f4bf75107c75ec78d65fd23cd8bc9ed7d895dca220acdc15b386e9"
    app "Vectorcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-0.9.0-linux-aarch64.AppImage"
      sha256 "dd1bb31e40e5e492a9d1655bb35e0b64e5a460d3e0dec8f4f793bb0bdd798d22"
    else
      url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-0.9.0-linux-x86_64.AppImage"
      sha256 "77eefa2c1ca7681e4b9aede638db314636da8d504aea107d48fb3367b6f61238"
    end
  end

  name "Vectorcraft"
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
