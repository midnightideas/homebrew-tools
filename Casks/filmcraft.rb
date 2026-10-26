cask "filmcraft" do
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.13.0/filmcraft-0.13.0-macos-universal.dmg"
        sha256 "1313efde320c25361c1bd015c47d18cc4ad40c9215e1eabf2a8ec5db6a7396ed"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.13.0/filmcraft-0.13.0-linux-aarch64.AppImage"
            sha256 "787c21759e05b33b6e2c429b03ce0b53d065a11f3827881296f3661f7b57fb8b"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.13.0/filmcraft-0.13.0-linux-x86_64.AppImage"
            sha256 "d2e604faa0546864485741703a2879c6ba2c55cc7f5cc4ba7d7dac1443a1a6ee"
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
