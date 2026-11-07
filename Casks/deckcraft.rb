cask "deckcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.16.0/deckcraft-0.16.0-macos-universal.dmg"
        sha256 "e9cf0eee693866a359e6905abcb30bb688dbaf57d604145d5668f1849b8ba247"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.16.0/deckcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "167e86a06fc0780823ff5ef6a5052e36d1809cd4e3e35f6726db12b2b4a63b49"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.16.0/deckcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "1211d8b517377eed0fc037d64daef1b75b7ee278e0620ab0d7e7beb6e86183f7"
        end
    end

    name "DeckCraft"
    desc "PowerPoint-style presentation builder"
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
