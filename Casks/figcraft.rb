cask "figcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.14.0/figcraft-0.14.0-macos-universal.dmg"
        sha256 "e80f7fce009b76d5565d5bb9e4e5f0b88c7c3d94675eccaff52f2640e6bbaad5"
        app "FigCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.14.0/figcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "edd95036ab7168e3f07b19463bad5cf4b433ee279bd4e28a15414b5f2d677df6"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.14.0/figcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "8f5318f1000b4f7e3a77895e8c5db0361d56306ac2bc13e60b2d2369a2d0db47"
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
