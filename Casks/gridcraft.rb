cask "gridcraft" do
  version "0.6.1"

  on_macos do
    url "https://github.com/storytold/gridcraft/releases/download/v0.6.1/gridcraft-0.6.1-macos-universal.dmg"
    sha256 "65b374d3098e7c6a76de93babccfe561201a02629433a392463c9eb298a3ba4f"
    app "Gridcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/gridcraft/releases/download/v0.6.1/gridcraft-0.6.1-linux-aarch64.AppImage"
      sha256 "9669cf7e0dd66b0aa4ef3569f1f37a2f683f8889df3af79adc4f697c5a5a3f77"
    else
      url "https://github.com/storytold/gridcraft/releases/download/v0.6.1/gridcraft-0.6.1-linux-x86_64.AppImage"
      sha256 "9db72f49a856f439a5c89b3eb4fd3ed51c4a7a996ebe6692e58d1e8f5da3c954"
    end
  end

  name "Gridcraft"
  desc "Excel-style spreadsheet application (Rust + egui)."
  homepage "https://github.com/storytold/gridcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/gridcraft",
    "~/.local/share/gridcraft",
    "~/.cache/gridcraft",
  ]
end
