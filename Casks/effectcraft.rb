cask "effectcraft" do
  version "0.9.2"

  on_macos do
    url "https://github.com/storytold/effectcraft/releases/download/v0.9.2/effectcraft-0.9.2-macos-universal.dmg"
    sha256 "abc02b0b7afda63802dbd4af8ded9c0c35f18af7b09e88002adcc986f676f6fe"
    app "EffectCraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/effectcraft/releases/download/v0.9.2/effectcraft-0.9.2-linux-aarch64.AppImage"
      sha256 "130631b777434f0d84beb88b2d7a89909a450a70bb54ed98becb406d08d2d1ba"
    else
      url "https://github.com/storytold/effectcraft/releases/download/v0.9.2/effectcraft-0.9.2-linux-x86_64.AppImage"
      sha256 "f5ef1c2ad32051ea6c13b13c170a73bd6f2d0a839a4ff71895b16a90d3a3ae37"
    end
  end

  name "EffectCraft"
  desc "After Effects-style motion graphics and compositing (Rust + egui)."
  homepage "https://github.com/storytold/effectcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/effectcraft",
    "~/.local/share/effectcraft",
    "~/.cache/effectcraft",
  ]
end
