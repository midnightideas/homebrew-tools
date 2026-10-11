cask "photocraft" do
  version "0.7.0"

  on_macos do
    url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-0.7.0-macos-universal.dmg"
    sha256 "cd04389f15518c6208ef3a1e4b9b16f9edbbd1ece3fa63f7876b5d8d411c8a4a"
    app "Photocraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-0.7.0-linux-aarch64.AppImage"
      sha256 "0aea5a09cf85d5eb49f58a45bed89da57962d8f3ec38e19b5fe48ffb445c335f"
    else
      url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-0.7.0-linux-x86_64.AppImage"
      sha256 "87ebce36bcdf6b31d16a9ca22ce29f9ad8db68185e4d98118800d1c2de78ac42"
    end
  end

  name "Photocraft"
  desc "Photoshop-style raster image editor (Rust + wgpu + egui)."
  homepage "https://github.com/storytold/photocraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/photocraft",
    "~/.local/share/photocraft",
    "~/.cache/photocraft",
  ]
end
