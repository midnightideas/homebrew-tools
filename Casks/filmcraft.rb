cask "filmcraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.10.0/filmcraft-0.10.0-macos-universal.dmg"
        sha256 "6da2e0e854bce43f0817247cc5bbaea8f09a3dcc12bc4a1b3f80dba2451e2702"
        app "FilmCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.10.0/filmcraft-0.10.0-linux-aarch64.AppImage"
            sha256 "984ca742b73f6c6a3c7876b9a2e81207dfb71ee8ddbfd8490c2144af597512f0"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.10.0/filmcraft-0.10.0-linux-x86_64.AppImage"
            sha256 "7873182c5cba651305fc9f74013e53637f6ad2ea818f877e2d1a5c04add9e361"
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
