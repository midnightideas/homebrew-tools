cask "filmcraft" do
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.9.0/filmcraft-0.9.0-macos-universal.dmg"
        sha256 "d654a23bbd039561a69bc5530203769040ca4961e228245abb843752526d2124"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.9.0/filmcraft-0.9.0-linux-aarch64.AppImage"
            sha256 "0c12287556b4aec4c89ffc7e65816411b91606cc8a3e9642e6ad395051036ced"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.9.0/filmcraft-0.9.0-linux-x86_64.AppImage"
            sha256 "784e4cdbd8982f17b4ec81caf5367fd308d70a123a7aa74bccd7420214c0c447"
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
