cask "filmcraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.18.0/filmcraft-0.18.0-macos-universal.dmg"
        sha256 "2f39bbdc26d782969305b35090250150734a3e99a379b32b50c46373a64f4e52"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.18.0/filmcraft-0.18.0-linux-aarch64.AppImage"
            sha256 "7b3ce768f525654692b34433f13860051758062ce78f1c8881b57e73f249b171"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.18.0/filmcraft-0.18.0-linux-x86_64.AppImage"
            sha256 "3f2d85e31414818f9ae569254bbdb2c24dc5f9bfb3f47a65870611eeff4be47d"
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
