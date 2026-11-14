cask "deckcraft" do
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.18.1/deckcraft-0.18.1-macos-universal.dmg"
        sha256 "3321d11f6353b3ff9de328f21407d7527f1f9029c83dab4e3ab734f516d3a055"
        app "DeckCraft.app"
        zap trash: [
            "~/Library/Application Support/DeckCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.18.1/deckcraft-0.18.1-linux-aarch64.AppImage"
            sha256 "894cb1dc7946918ffe6f0cdce32d9e2157d149faea6737638164083d5e562615"
            app_image "deckcraft-0.18.1-linux-aarch64.AppImage", target: "DeckCraft.AppImage"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.18.1/deckcraft-0.18.1-linux-x86_64.AppImage"
            sha256 "68df9f040d3f6c4ce4a904aadec633961fa199248f0a1aa366fa64597ae09867"
            app_image "deckcraft-0.18.1-linux-x86_64.AppImage", target: "DeckCraft.AppImage"
        end
        zap trash: [
            "~/.config/deckcraft",
            "~/.local/share/deckcraft",
        ]
    end

    name "DeckCraft"
    desc "PowerPoint-style presentation builder"
    homepage "https://github.com/storytold/deckcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
