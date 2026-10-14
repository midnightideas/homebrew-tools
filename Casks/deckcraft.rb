cask "deckcraft" do
  version "0.6.1"

  on_macos do
    url "https://github.com/storytold/deckcraft/releases/download/v0.6.1/deckcraft-0.6.1-macos-universal.dmg"
    sha256 "7f9dcb6dc235cc605dfff31a68c4c75fd2ace8a5117cd3b4ef31deaee941619a"
    app "DeckCraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/deckcraft/releases/download/v0.6.1/deckcraft-0.6.1-linux-aarch64.AppImage"
      sha256 "72523202a8dc07577af0b417973e3ed47723b999dfe8e94437a66cb7e7573619"
    else
      url "https://github.com/storytold/deckcraft/releases/download/v0.6.1/deckcraft-0.6.1-linux-x86_64.AppImage"
      sha256 "821650d3f87a7212306f33b8b7b05cf19d13390a31359ef3b74a3c33cf18ed21"
    end
  end

  name "DeckCraft"
  desc "PowerPoint-style presentation builder (Rust + egui)."
  homepage "https://github.com/storytold/deckcraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  zap trash: [
    "~/.config/deckcraft",
    "~/.local/share/deckcraft",
    "~/.cache/deckcraft",
  ]
end
