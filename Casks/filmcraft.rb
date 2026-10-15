cask "filmcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.8.0/filmcraft-0.8.0-macos-universal.dmg"
        sha256 "7587a8fe3d398da58027c6dbe5566d08568668c8e041de7bbb512a4672229a9a"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.8.0/filmcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "ded956efbb5c0cb22d7492ff83238c1cff42a88adc4c8d8bfdfa384dc02f179a"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.8.0/filmcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "41955e97c8932435f2b6bb8245783c668786b33d2b7df962bd097641da68211e"
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
