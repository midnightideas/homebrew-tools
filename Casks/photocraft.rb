cask "photocraft" do
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.20.1/photocraft-0.20.1-macos-universal.dmg"
        sha256 "5486555dc749df1650f321e363534e603a7c4f80ea31c54d9e88489ff742db03"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.20.1/photocraft-0.20.1-linux-aarch64.AppImage"
            sha256 "02f65fad7ff7585191751df73a0d0a1364e0c3f1fbcf5e5458993792cdf410d5"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.20.1/photocraft-0.20.1-linux-x86_64.AppImage"
            sha256 "d7c605fd05ea2334e2771e1358fe4d900dbbff14f02d766070c141e2e3ad4bbf"
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
