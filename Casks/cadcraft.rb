cask "cadcraft" do
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.13.0/cadcraft-0.13.0-macos-universal.dmg"
        sha256 "539f27c1fa2fe79fe2f1c562fe9eb07b1790ffd2cd7bf1e438e9c719383aeb29"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.13.0/cadcraft-0.13.0-linux-aarch64.AppImage"
            sha256 "e1955e281d24a36b9fed23e03120a660ec6cd8e9967c449081f48d91efab3872"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.13.0/cadcraft-0.13.0-linux-x86_64.AppImage"
            sha256 "435ed551849bb0dbd24a0de86b5bb82e9a4e94e06d5890b57a313a7a5fe8d073"
        end
    end

    name "CADCraft"
    desc "AutoCAD-style 2D/3D CAD application"
    homepage "https://github.com/storytold/cadcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/cadcraft",
        "~/.local/share/cadcraft",
        "~/.cache/cadcraft",
    ]
end
