cask "cadcraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.10.0/cadcraft-0.10.0-macos-universal.dmg"
        sha256 "6417b10c317418e50b4f5bf7c90eb7066aca18e29d32763bc7b3a5cce5bec394"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.10.0/cadcraft-0.10.0-linux-aarch64.AppImage"
            sha256 "7cb1fc25fe88e6f5c5ac1217d26136be7fd54fae5cc440873589c1d28c2ac4c7"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.10.0/cadcraft-0.10.0-linux-x86_64.AppImage"
            sha256 "f26c2c05da223c3189d08c50ac431b9d0738622a4b3d8b4435cb7eca99caa607"
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
