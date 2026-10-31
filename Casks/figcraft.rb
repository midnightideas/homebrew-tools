cask "figcraft" do
    version "0.13.1"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-0.13.1-macos-universal.dmg"
        sha256 "87a2d8bbc06c09bfb50541269769943d7ef2498425310615f0c749741d54259d"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-0.13.1-linux-aarch64.AppImage"
            sha256 "1e9de7d57b2f313354dddf8ea98b3fd5f03bfcb30ce7c2cf38efc65c78f895ad"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-0.13.1-linux-x86_64.AppImage"
            sha256 "2fa44efdf4878dea7eb79b1227f274bccb298aab6431d78d0e8370ea6c125474"
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
