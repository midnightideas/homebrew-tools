cask "wordcraft" do
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.12.0/wordcraft-0.12.0-macos-universal.dmg"
        sha256 "2444eb9ca2755f4655c55e97d9de63876f338a1588ab35e912ac76f38cea7709"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.12.0/wordcraft-0.12.0-linux-aarch64.AppImage"
            sha256 "4b01993f624eddfc90fab8a75ca93b9d3c22427597f0338044d11ba7efb61cc5"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.12.0/wordcraft-0.12.0-linux-x86_64.AppImage"
            sha256 "d0730024db6c969e79ebaa9cc9abcdfbb198ea9b29c9bd0a2a04f9834e7656cb"
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
