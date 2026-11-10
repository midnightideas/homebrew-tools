cask "deckcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.17.0/deckcraft-0.17.0-macos-universal.dmg"
        sha256 "df61a54297f0222493d5d936c3d5be05f93800b5f0d8d112d805c542e35b8848"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.17.0/deckcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "17853c904bad22087cf75d24ac14eee8a97cb28dc9321c2538ba17bcb6655154"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.17.0/deckcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "a03d2f091a541c32b14f4f67de89729d28698dc293f1f9a622f5419d643da597"
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
