cask "deckcraft" do
    version "0.14.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.14.1/deckcraft-0.14.1-macos-universal.dmg"
        sha256 "377a62fa23989c6dccc4e269e2e1473a534b5b3fe96bac62f0ad962a76225794"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.14.1/deckcraft-0.14.1-linux-aarch64.AppImage"
            sha256 "ea7f1667cd69708531999e4b80c59f302b176583c44bf356d0510a1e03249589"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.14.1/deckcraft-0.14.1-linux-x86_64.AppImage"
            sha256 "c9e05af251d8ab0b07f6048df81d4181614079569f8aed6380e44c61b5eba635"
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
