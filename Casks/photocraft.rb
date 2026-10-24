cask "photocraft" do
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.15.1/photocraft-0.15.1-macos-universal.dmg"
        sha256 "a1c07b7c52d8f60e772e3fb2017fff7fbafccf81fa30f51d8e2c36bfad361461"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.15.1/photocraft-0.15.1-linux-aarch64.AppImage"
            sha256 "1a56a7c8afe789fde7e062a81eac6ad8d391acb297d744d35401b79a26d6b931"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.15.1/photocraft-0.15.1-linux-x86_64.AppImage"
            sha256 "7d96f3d0da1921d634620b0d4cda37cbf3353a767f920b906ce1c6667380ffed"
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
