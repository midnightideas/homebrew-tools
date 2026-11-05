cask "photocraft" do
    version "0.20.2"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.20.2/photocraft-0.20.2-macos-universal.dmg"
        sha256 "89f2ed4d4a737ec8aaa570165815bab0a824df3f453493b0a501f915179e9a55"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.20.2/photocraft-0.20.2-linux-aarch64.AppImage"
            sha256 "8f298b39a67d8fe519a99aa752da017862c8e346f3a135205478fd5db5bd703a"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.20.2/photocraft-0.20.2-linux-x86_64.AppImage"
            sha256 "be18d175a0a6278c30124241793bb77b357ef96046d81f1d8189e492c14bc0ae"
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
