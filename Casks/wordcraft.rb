cask "wordcraft" do
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-macos-universal.dmg"
        sha256 "0e2030b27157a42be151a28bae03a11589c08404d166d55d6d0bdded65b0d22b"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-linux-aarch64.AppImage"
            sha256 "d5af2e9f69730896283ba6c68beb760369364547101e5cf659e2c9c74fbba9c6"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.11.0/wordcraft-0.11.0-linux-x86_64.AppImage"
            sha256 "d92d5d37752b95f08904cc8328f3a73c2979361337ff260d23518f4024cd5c64"
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
