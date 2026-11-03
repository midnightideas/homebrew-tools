cask "deckcraft" do
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.15.0/deckcraft-0.15.0-macos-universal.dmg"
        sha256 "e3ec0d063586842a34865a82b179cbc3048fb4ed3963f38e1518597a297f5f57"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.15.0/deckcraft-0.15.0-linux-aarch64.AppImage"
            sha256 "83623d10bbd5a5302cc22a348149c25a9eb83624eecf70c05f75fe23b9cdbdb6"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.15.0/deckcraft-0.15.0-linux-x86_64.AppImage"
            sha256 "569034a273b69bca9b8373355b92f8f0fe932a1c52b96a81c4488151c68a1999"
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
