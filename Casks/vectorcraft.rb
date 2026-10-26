cask "vectorcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.17.0/vectorcraft-0.17.0-macos-universal.dmg"
        sha256 "0bd3f5ea47293cd6a55001463089bea3c6d98e5ba657fa006799c2be8787505a"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.17.0/vectorcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "297f7bdb7739c907d40a00fe3a5c083e18338714e5e883334d9ffb9f45d77052"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.17.0/vectorcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "e4984887bdb980196dea241e86831e54613ccfd434e4eb74b7498ada2bb549e3"
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
