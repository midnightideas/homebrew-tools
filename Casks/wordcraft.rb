cask "wordcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.17.0/wordcraft-0.17.0-macos-universal.dmg"
        sha256 "be5d89a23905c3a91df4d58f00f827ac06aa8c50cbeb41e6e7d9f7dfb864a58a"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.17.0/wordcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "3b044e86d84180a05a488b42249311a9d1ed835190c13c4af11ceaf5879cedfc"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.17.0/wordcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "606b3ae330c767cfa192803dba8eb7b9d29c66cdf29d0cabde083f17f06ad16b"
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
