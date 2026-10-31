cask "filmcraft" do
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.15.0/filmcraft-0.15.0-macos-universal.dmg"
        sha256 "a38a40516eb60d6a24741b09f1ec2c763bb40e01eca1af11fd6de0bc53a38bf4"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.15.0/filmcraft-0.15.0-linux-aarch64.AppImage"
            sha256 "93beed6c51382180a0c4497be84a5249eb26efe9a3968df6919a0ebdd025d26c"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.15.0/filmcraft-0.15.0-linux-x86_64.AppImage"
            sha256 "4bcb119c1aa60df54ce3338d7aa48e3f14d61569f7bc63851a00bdc89249647b"
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
