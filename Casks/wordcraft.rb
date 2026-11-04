cask "wordcraft" do
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.15.1/wordcraft-0.15.1-macos-universal.dmg"
        sha256 "8ee59436328e24518386c6cf1407f7c6c081fcaca703ce5e5310938af7dab12f"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.1/wordcraft-0.15.1-linux-aarch64.AppImage"
            sha256 "489bec9ac0c441bcfc30c14a7f5c713d971545e8bb5b30afd25d9b8164779aae"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.1/wordcraft-0.15.1-linux-x86_64.AppImage"
            sha256 "e8f44fbbf059f12f5cd4f69d7812529729d85d36dd4fe74a6c37f6932632f2fa"
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
