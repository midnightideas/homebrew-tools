cask "filmcraft" do
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.12.0/filmcraft-0.12.0-macos-universal.dmg"
        sha256 "1ed0bec3be74766fa6c81d6289c6763d5696f93946e7d698162498143c72b87e"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.12.0/filmcraft-0.12.0-linux-aarch64.AppImage"
            sha256 "a5ec2c07b2a49b9616bebe54e4ee91cef37b4a24963a2cb723f91582ac2ceabb"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.12.0/filmcraft-0.12.0-linux-x86_64.AppImage"
            sha256 "10933f9176835805459bb60dcb8102392b065467eca110db7ee15b55a11c9e96"
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
