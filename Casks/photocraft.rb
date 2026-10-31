cask "photocraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.18.0/photocraft-0.18.0-macos-universal.dmg"
        sha256 "20335daabedacfed91fa579e77a2ac18d261a735057782b87492827876cb0f91"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.18.0/photocraft-0.18.0-linux-aarch64.AppImage"
            sha256 "ce3002bb8c5e6b783ac6a2d9c1cd033e08fb9ad5e7d75cd3da4d0c9bedbdc5ff"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.18.0/photocraft-0.18.0-linux-x86_64.AppImage"
            sha256 "830757acae87b5dea20f25200392de118a143a35dc1b52041a3526120267e684"
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
