cask "vectorcraft" do
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.11.0/vectorcraft-0.11.0-macos-universal.dmg"
        sha256 "dc5eb8c02ecdff801876d4b511f2d2a9bd3af7700853ec8cbe81063221827d6b"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.11.0/vectorcraft-0.11.0-linux-aarch64.AppImage"
            sha256 "9d4577e61d6cc6728c1874ffa0f797b7311a9694134bad23282cdfd9dfbc889b"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.11.0/vectorcraft-0.11.0-linux-x86_64.AppImage"
            sha256 "0ab5126f9b2f9591bc27a10e20ea1b2f239384b1a16fec88288ed3de6dbf831c"
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
