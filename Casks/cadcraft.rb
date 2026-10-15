cask "cadcraft" do
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.7.0/cadcraft-0.7.0-macos-universal.dmg"
        sha256 "a2e37617aa675c955e1ee97d1efb9c3e1ce4dcaec705c7083d695cdd3ef236b7"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.7.0/cadcraft-0.7.0-linux-aarch64.AppImage"
            sha256 "8c745bff42ac94f784d228f03a8f1d733f029b09f2771d69073690532d08485e"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.7.0/cadcraft-0.7.0-linux-x86_64.AppImage"
            sha256 "b2aa2807c886e1bae7b0064f47688a62ed6fe1fa05f05b352e362cdc698f0b77"
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
