cask "photocraft" do
    version "0.21.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.21.0/photocraft-0.21.0-macos-universal.dmg"
        sha256 "aa43b184ae8a2ae2340b7f2522a996431ffec3597ec76b6d977a44a6cbd7bab1"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.21.0/photocraft-0.21.0-linux-aarch64.AppImage"
            sha256 "5027514031c2862bf3ae21a073e33ee2523acda5974f519dfa6487d689352a2b"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.21.0/photocraft-0.21.0-linux-x86_64.AppImage"
            sha256 "7726533adaa5896413d2ce0be858d522256450bfef244fbc5433bed4f99fa60b"
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
