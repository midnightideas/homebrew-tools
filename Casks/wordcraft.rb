cask "wordcraft" do
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.15.0/wordcraft-0.15.0-macos-universal.dmg"
        sha256 "e07c3f58383ed1e3455b0b81e95f4d124b6bd395365074280686918d04478815"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.0/wordcraft-0.15.0-linux-aarch64.AppImage"
            sha256 "35098ecabbd4591d86ffa74ceb618e82d976fe47a8eb8177dcd3940088a36eb3"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.0/wordcraft-0.15.0-linux-x86_64.AppImage"
            sha256 "f7a955d2c51b036bfe5a033f4a4ec4ff0c2b11ec8dfcbb252087b9ad3aa2ecad"
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
