cask "deckcraft" do
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.15.1/deckcraft-0.15.1-macos-universal.dmg"
        sha256 "bfef3703ddfe4c2fb591419d7a1937483e3de2804448a7f262965f3c5dcdc93b"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.15.1/deckcraft-0.15.1-linux-aarch64.AppImage"
            sha256 "d8eb23109cad4c423f345b8e503631e65be8ef8d5a8eef5e9ebba1697fa13a5e"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.15.1/deckcraft-0.15.1-linux-x86_64.AppImage"
            sha256 "f9557d153189597839a456133dcf97272baac152031871fad0aec3b6d6560785"
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
