cask "figcraft" do
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.9.0/figcraft-0.9.0-macos-universal.dmg"
        sha256 "21c9ff7463d459f80fc8db9e8e4cb12dc5ef4298e9066493b9d1c3ca9da65ff7"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.9.0/figcraft-0.9.0-linux-aarch64.AppImage"
            sha256 "e34a40425b1736a7f73c3585312404e53c7a37601cc17f9108aa9a5e976814b4"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.9.0/figcraft-0.9.0-linux-x86_64.AppImage"
            sha256 "909599e0e7612d7f85144f685d80e20d285a3295ffa6c5c106b60be3d9dea58a"
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
