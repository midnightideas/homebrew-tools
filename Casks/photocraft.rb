cask "photocraft" do
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.12.0/photocraft-0.12.0-macos-universal.dmg"
        sha256 "5b439694603f11ccf93946ef474091afadc9fb1890ad8022723d160d4fccc08d"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.12.0/photocraft-0.12.0-linux-aarch64.AppImage"
            sha256 "1552c5d4ed82d1a74d7669330ae4904925e2eee5c6546c05012ffe93259a8932"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.12.0/photocraft-0.12.0-linux-x86_64.AppImage"
            sha256 "da821339afce93b72991c7900a28f589eb06a885e0ab59ea702ddec9a280ac66"
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
