cask "wordcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.8.0/wordcraft-0.8.0-macos-universal.dmg"
        sha256 "9c7c058e4bc0ea3dd4e7f350e934b5e5ff5798723937f382c77478a6978f89e3"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.8.0/wordcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "a2c695a064c8da13bd00e118258bac5cdfa9b7e6dc7d8f3dfdd87f561298e76a"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.8.0/wordcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "7df7b3a50172ba0ede85a2c4b83c360af92b1c3767c8b30c3963ebf05d36ab9c"
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
