cask "wordcraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.10.0/wordcraft-0.10.0-macos-universal.dmg"
        sha256 "342e37473db29cd671a10a340cc7484af86516fd63731a545fd93cef207fe86a"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.10.0/wordcraft-0.10.0-linux-aarch64.AppImage"
            sha256 "2f6dd878019b569425f32921a4d642110172610b8f065c345c2bf0b81093be5b"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.10.0/wordcraft-0.10.0-linux-x86_64.AppImage"
            sha256 "2eb8eaaf6be989a46f5a125286a99f5c2f6efa5c8bb23ba50a4423bbea107a20"
        end
    end

    name "WordCraft"
    desc "Word-style word processor for .docx files"
    homepage "https://github.com/storytold/wordcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/wordcraft",
        "~/.local/share/wordcraft",
        "~/.cache/wordcraft",
    ]
end
