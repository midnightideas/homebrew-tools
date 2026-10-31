cask "wordcraft" do
    version "0.13.2"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.13.2/wordcraft-0.13.2-macos-universal.dmg"
        sha256 "6b142b8f00542449a32581f832e2938c7cd7628be0b969fc582f571f7dee26d0"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.13.2/wordcraft-0.13.2-linux-aarch64.AppImage"
            sha256 "9d82a4164c853a0d04c2947dd6683a9d92cb4a3b7a392fba571e320f0f3c773f"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.13.2/wordcraft-0.13.2-linux-x86_64.AppImage"
            sha256 "f25d4ec7be7af33fcf45002d9b750ec735117c44da3042e043ae79357d444533"
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
