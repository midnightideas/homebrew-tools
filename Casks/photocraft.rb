cask "photocraft" do
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.19.0/photocraft-0.19.0-macos-universal.dmg"
        sha256 "4024b531f14cc96c3d3e33dcc5e12c4b5114d219a01323d0173fd534459fd368"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.19.0/photocraft-0.19.0-linux-aarch64.AppImage"
            sha256 "755d7aa07c966995caf154fedca5dee0c1cbc8f5c7c2679c67a8be6d6467322d"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.19.0/photocraft-0.19.0-linux-x86_64.AppImage"
            sha256 "0cd30b366d40090aba01b0a1fe021bdcfc02b11ff9151c7aaced5b663db9b856"
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
