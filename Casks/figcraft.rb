cask "figcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.16.0/figcraft-0.16.0-macos-universal.dmg"
        sha256 "8ab18e498d557962c154e97848b650270d3fbfbcd4d606ffc285f6ebd5a159b1"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.16.0/figcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "2f8362617b149649667dcb4b9eb60379801e771f57de588f737241a8a673ffb4"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.16.0/figcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "c652030a574e730ff571ef795c305af26faa87475745f1a3e553ae6a39706675"
        end
    end

    name "FigCraft"
    desc "Figma-style collaborative design and prototyping tool"
    homepage "https://github.com/storytold/figcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/figcraft",
        "~/.local/share/figcraft",
        "~/.cache/figcraft",
    ]
end
