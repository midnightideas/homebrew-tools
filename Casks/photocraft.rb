cask "photocraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.17.0/photocraft-0.17.0-macos-universal.dmg"
        sha256 "6e0903172a7440ce4e71002f5585ba4eff588fa3fc99b78cd9811180cabd5b80"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.17.0/photocraft-0.17.0-linux-aarch64.AppImage"
            sha256 "8f6f34dba1a68802a154139172d80e6a310759a78a75f02d39d5b26ccf3384eb"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.17.0/photocraft-0.17.0-linux-x86_64.AppImage"
            sha256 "ce77299f243534ac1d248aa81c9a9fd278ae407c024cb931e03931eb70be54af"
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
