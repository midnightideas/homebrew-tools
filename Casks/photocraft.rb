cask "photocraft" do
    version "0.22.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.22.0/photocraft-0.22.0-macos-universal.dmg"
        sha256 "027596dcb13db0c0d749315c052493bf587886e9d081afa57cbc6575a4cde6e9"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.22.0/photocraft-0.22.0-linux-aarch64.AppImage"
            sha256 "8972885159ee575507e02d7c3d784ba2a6598a3ed20469d72586c8b9a69d6663"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.22.0/photocraft-0.22.0-linux-x86_64.AppImage"
            sha256 "cee934e6c38c0ff7f8cd7ee03694128be05be137fc4301180e2f716e7d2a1f9f"
        end
    end

    name "PhotoCraft"
    desc "Photoshop-style raster image editor"
    homepage "https://github.com/storytold/photocraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/photocraft",
        "~/.local/share/photocraft",
        "~/.cache/photocraft",
    ]
end
