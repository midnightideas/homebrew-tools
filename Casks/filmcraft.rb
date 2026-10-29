cask "filmcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.14.0/filmcraft-0.14.0-macos-universal.dmg"
        sha256 "9f87564f83f55d9dea32ceeb73aa3cb74b15aec05347dd3e163fd0a6abef6b27"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.14.0/filmcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "b6e447df17efb3ade880d412a0c3855177320dc4b8cee90d395d343c9fb442c4"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.14.0/filmcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "133b8b88db6dee3fa47dd39fc1c9dd9228283806a37b951587cc6365aec9a3d3"
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
