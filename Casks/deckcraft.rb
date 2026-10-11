cask "deckcraft" do
  version "0.5.0"

  on_macos do
    url "https://github.com/storytold/deckcraft/releases/download/v#{version}/deckcraft-0.5.0-macos-universal.dmg"
    sha256 "9ffaa97a5051dfaf8220a989bb4eec969cc7d3da2373c431ef37d2d4ef1b2c0e"
    app "Deckcraft.app"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/storytold/deckcraft/releases/download/v#{version}/deckcraft-0.5.0-linux-aarch64.AppImage"
      sha256 "ad9f726b0ab9590efbef2cd9f34aebeb7bdae58cceb56e063ba333bba4f64d10"
    else
      url "https://github.com/storytold/deckcraft/releases/download/v#{version}/deckcraft-0.5.0-linux-x86_64.AppImage"
      sha256 "662f6236a1c0a81c326e80b126afd55dd68dc2a12c33bbc3009f06d9f39b311e"
    end
  end

  name "Deckcraft"
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
