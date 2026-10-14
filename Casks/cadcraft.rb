cask "cadcraft" do
  version "0.6.2"

  on_macos do
    url "https://github.com/storytold/cadcraft/releases/download/v0.6.2/cadcraft-0.6.2-macos-universal.dmg"
    sha256 "f8255281d824a1a8b0f051f7d11e41a786ab081d8873f517ae64bbb7e1a14c8c"
    app "CADCraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/cadcraft/releases/download/v0.6.2/cadcraft-0.6.2-linux-aarch64.AppImage"
      sha256 "0a00a4270f8d012de3b2adbf072cc040d7dc472417df065bf156884e5e638998"
    else
      url "https://github.com/storytold/cadcraft/releases/download/v0.6.2/cadcraft-0.6.2-linux-x86_64.AppImage"
      sha256 "32daada11b9b6e512e72aa071cebf3caf17f741b85f094749bff39ad36036ad1"
    end
  end

  name "CADCraft"
  desc "AutoCAD-style 2D/3D CAD application"
  homepage "https://github.com/storytold/cadcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/cadcraft",
    "~/.local/share/cadcraft",
    "~/.cache/cadcraft",
  ]
end
