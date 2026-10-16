cask "vectorcraft" do
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.12.0/vectorcraft-0.12.0-macos-universal.dmg"
        sha256 "e47987d0e90fa1c629cf1328d83b91f82680b4c02d06794bdf5e3eb0b2c4dc7b"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.12.0/vectorcraft-0.12.0-linux-aarch64.AppImage"
            sha256 "e128becdde7f2e89f80ae3ff1abaff2b759ee519bdb5adb6952d8e5a3612cf5c"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.12.0/vectorcraft-0.12.0-linux-x86_64.AppImage"
            sha256 "d0b9c41f3754297f7c6892f7129db88f41e7e718e452d795d3c1c4e9e3eb448b"
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
