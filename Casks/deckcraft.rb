cask "deckcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.8.0/deckcraft-0.8.0-macos-universal.dmg"
        sha256 "81ee3158cbb550951faf89888bf7f0ea296fc233593aecfc3f41c7d9dce88542"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.8.0/deckcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "a3ff498caac3bbe8a72297ded63d94cd8f78315a0ffaf30b6af7717ce2df9fd2"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.8.0/deckcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "5c24e0c3d52c710219fb6b897cbf2e856e0f6dd4dc79b7a2cefc1d2d55134ed0"
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
