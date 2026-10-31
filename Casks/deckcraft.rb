cask "deckcraft" do
    version "0.13.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.13.1/deckcraft-0.13.1-macos-universal.dmg"
        sha256 "9e426cea47d78fd371dfff4c9a57bfef1ddfe592c3876e86d79f28bcaae90cc7"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.13.1/deckcraft-0.13.1-linux-aarch64.AppImage"
            sha256 "37ce2c3cc2a9dce624964ecff8421fac6acf62a814a334b74dca0b1ca65e9b7d"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.13.1/deckcraft-0.13.1-linux-x86_64.AppImage"
            sha256 "e2cbf93738fcb308fe9cc8422de07fb60905734156dfd56b377fd2a78a918b20"
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
