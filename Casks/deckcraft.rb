cask "deckcraft" do
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.9.0/deckcraft-0.9.0-macos-universal.dmg"
        sha256 "15957ed499818442a989ec8879d70154266c7c85496171fa150e45ea2c424af9"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.9.0/deckcraft-0.9.0-linux-aarch64.AppImage"
            sha256 "453fb2159670ab371baeb5fccc44a4d6a57fdd03c564b531ec0b6a4ba57bcaee"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.9.0/deckcraft-0.9.0-linux-x86_64.AppImage"
            sha256 "4506f8d47f44e779b7463a872e0fc35fea99eedf9ceff27601c8c1344b928a05"
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
