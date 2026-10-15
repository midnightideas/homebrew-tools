cask "photocraft" do
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.9.0/photocraft-0.9.0-macos-universal.dmg"
        sha256 "06503eb1c845990e99f8824831cc73b274e2b1dbe4461eb6460dfc9a6008239d"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.9.0/photocraft-0.9.0-linux-aarch64.AppImage"
            sha256 "2752b5097e2788cc1ab0c7b410657b1eab790bcc3b576f8749de707282dba9e3"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.9.0/photocraft-0.9.0-linux-x86_64.AppImage"
            sha256 "483a9a79200e0c0864bb54cf3faa6a55e2b79c1433dacfcb153d3862e78f32bc"
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
