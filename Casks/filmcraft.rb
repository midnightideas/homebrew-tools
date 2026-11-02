cask "filmcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.16.0/filmcraft-0.16.0-macos-universal.dmg"
        sha256 "2d7aa2fbde8266e755b4e2573566738bcffba5c01d7d760045971f17d84b5ffc"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.16.0/filmcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "c016e2e550dede376ca1d5f1520a7fd04de3fdfa88561e8502fb0118ccb2dd01"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.16.0/filmcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "c2be1b654a6df980870213901785656075247e4e8e530545a97886dec4a2f050"
        end
    end

    name "FilmCraft"
    desc "Premiere-style non-linear video editor"
    homepage "https://github.com/storytold/filmcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/filmcraft",
        "~/.local/share/filmcraft",
        "~/.cache/filmcraft",
    ]
end
