cask "photocraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.10.0/photocraft-0.10.0-macos-universal.dmg"
        sha256 "2f2e21a0119e8e63b2b2f93d238817b3727af88720ab9e2b6deb1458927a3b1f"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.10.0/photocraft-0.10.0-linux-aarch64.AppImage"
            sha256 "802de997beb3fa9bc387629b499e82704b48af839ac85f2553ea9c2b2022845f"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.10.0/photocraft-0.10.0-linux-x86_64.AppImage"
            sha256 "cd1a33c979e8a5da94ded81d7648e779cb8069b77e4aca743c8d177ca5270d77"
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
