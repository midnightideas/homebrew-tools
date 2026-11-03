cask "gridcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.16.0/gridcraft-0.16.0-macos-universal.dmg"
        sha256 "1a40e3d76cfd4fa945d1e77f3eba49b1b7188133ea53ae08f49c293c3696581d"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.16.0/gridcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "8ce1ab5aa3391833cad6d19e14d482631f10561210754066498e5e9d80ce8d64"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.16.0/gridcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "1b4b7a05337e1deead52b3ee6027a3ef66959fc81d86244f6ab733abe318386a"
        end
    end

    name "GridCraft"
    desc "Excel-style spreadsheet application"
    homepage "https://github.com/storytold/gridcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/gridcraft",
        "~/.local/share/gridcraft",
        "~/.cache/gridcraft",
    ]
end
