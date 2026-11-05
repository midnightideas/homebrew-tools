cask "vectorcraft" do
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.21.1/vectorcraft-0.21.1-macos-universal.dmg"
        sha256 "27fd4d3ed472d92eb68154ca75cf25cb856682626715632b2abac2551f3c08bf"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.21.1/vectorcraft-0.21.1-linux-aarch64.AppImage"
            sha256 "42c9aaf9578454a5a42eea1a8746c3b2a150193c51de9cf1b12e7c289e693be2"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.21.1/vectorcraft-0.21.1-linux-x86_64.AppImage"
            sha256 "7865429846119772dbd5dd9395cba88c7190cff5b92b17b141103ae7285c99e0"
        end
    end

    name "VectorCraft"
    desc "Illustrator-style vector editor"
    homepage "https://github.com/storytold/vectorcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/vectorcraft",
        "~/.local/share/vectorcraft",
        "~/.cache/vectorcraft",
    ]
end
