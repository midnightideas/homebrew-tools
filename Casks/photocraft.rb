cask "photocraft" do
    version "0.11.1"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.11.1/photocraft-0.11.1-macos-universal.dmg"
        sha256 "9114cbf5ada2f9fa91b4566d053257924cbd50e477b207ea3fdf7188a4ecfbd3"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.11.1/photocraft-0.11.1-linux-aarch64.AppImage"
            sha256 "e84ae9a44c24bba10f6c8e3a74478ce84d4b5296d8f98ce0be1fdf11f5fbe792"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.11.1/photocraft-0.11.1-linux-x86_64.AppImage"
            sha256 "8a69f0578b155118f40048cd57da83bf967b2fcd18ecfa1c2f98d05fdb61a7ef"
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
