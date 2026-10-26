cask "deckcraft" do
    version "0.11.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.11.1/deckcraft-0.11.1-macos-universal.dmg"
        sha256 "c0b4e89c004b31187832afce312f279f15f5adb7db61808db74608d822726f1d"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.11.1/deckcraft-0.11.1-linux-aarch64.AppImage"
            sha256 "7c634421e010858651e258bb4fed59987839336e859f6120357b977b12ae9be8"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.11.1/deckcraft-0.11.1-linux-x86_64.AppImage"
            sha256 "156cb9ef0924bec508524f3a52ba63055a8a74f860bf4588429aefdac6d5fb01"
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
