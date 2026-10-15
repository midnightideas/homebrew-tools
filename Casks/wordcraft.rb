cask "wordcraft" do
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.7.0/wordcraft-0.7.0-macos-universal.dmg"
        sha256 "682eedce8ed59e370f0e86451ce46d359361bfbb1e87bc4a1a2ef044016410ea"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.7.0/wordcraft-0.7.0-linux-aarch64.AppImage"
            sha256 "872c8fc671c60c5d86eb5ff36ea91cf61ec8ce0f0adca344b13d1f10c145ff0c"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.7.0/wordcraft-0.7.0-linux-x86_64.AppImage"
            sha256 "7dc86ff3025f185be39bf19822af24f2c504ddead3f52ed99c3d6960bce58d4d"
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
