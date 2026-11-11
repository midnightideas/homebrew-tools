cask "filmcraft" do
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.19.0/filmcraft-0.19.0-macos-universal.dmg"
        sha256 "31a33ee46b39ad9af8c10674c756514c71d313bb1e68b5435c9ecd71b46bec54"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.19.0/filmcraft-0.19.0-linux-aarch64.AppImage"
            sha256 "87d01bc9216693e5ce4143a92f768f74b5e15dba81a8637b4c90cfa463edf1c7"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.19.0/filmcraft-0.19.0-linux-x86_64.AppImage"
            sha256 "2f09cff6963b55bc2160158060af8de226b0ec8fc223a198b10145a58e238fe8"
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
