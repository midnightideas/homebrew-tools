cask "deckcraft" do
    version "0.19.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.19.1/deckcraft-0.19.1-macos-universal.dmg"
        sha256 "a5233f28b031b74edc4a07df2a0068d43b82ccadfdac865f145765d28b2ce746"
        app "DeckCraft.app"
        zap trash: [
            "~/Library/Application Support/DeckCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.19.1/deckcraft-0.19.1-linux-aarch64.AppImage"
            sha256 "548200b8b1adf79c72860a40abe1c6f2d7f4189a4a9475668873b5732d8c4f00"
            app_image "deckcraft-0.19.1-linux-aarch64.AppImage", target: "DeckCraft.AppImage"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.19.1/deckcraft-0.19.1-linux-x86_64.AppImage"
            sha256 "8295d0fb795bbd0c7ab8ae97cdf0993e1e6cf14d90aac35aab78b816dcdaa2fe"
            app_image "deckcraft-0.19.1-linux-x86_64.AppImage", target: "DeckCraft.AppImage"
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
