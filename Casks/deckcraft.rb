cask "deckcraft" do
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.7.0/deckcraft-0.7.0-macos-universal.dmg"
        sha256 "9591b14641d089c1ce36c7f57247e92f0488e90a70d047bb6fa09a12c3453bd9"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.7.0/deckcraft-0.7.0-linux-aarch64.AppImage"
            sha256 "6e9086067c3372f5361c9eafb2735dd24ebcdaebb4159cfdd7151ff2509e4354"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.7.0/deckcraft-0.7.0-linux-x86_64.AppImage"
            sha256 "535afd1e7f6d389ecfe78f4a702b5a36719217c4cec556ae5d7f0fd775ae5584"
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
