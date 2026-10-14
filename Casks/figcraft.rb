cask "figcraft" do
    version "0.5.1"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.5.1/figcraft-0.5.1-macos-universal.dmg"
        sha256 "4fa3323b58646e6b6008d11e90c47bd169d7002f36f83f62ec15feaf2b0b1e37"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.5.1/figcraft-0.5.1-linux-aarch64.AppImage"
            sha256 "d38427313649df4289c74e8c666821066815feb88b988551576f644d0b340f04"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.5.1/figcraft-0.5.1-linux-x86_64.AppImage"
            sha256 "ee44890974cad9e67aed438bcd03f5cbeff35149f548887d7b18fe3f80adf484"
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
