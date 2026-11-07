cask "cadcraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.18.0/cadcraft-0.18.0-macos-universal.dmg"
        sha256 "e59d98615fcecc9d5ef0650c63486229d7d2aa22914fb8d1050a5d071329f9c9"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.18.0/cadcraft-0.18.0-linux-aarch64.AppImage"
            sha256 "be78b1a9851a62a97a4c66af3f2447640ec9afaec446d0551def80dc4878ac7c"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.18.0/cadcraft-0.18.0-linux-x86_64.AppImage"
            sha256 "cec4ccfe5b11c9ada64488e6f2a673de72d30e354cab19e6b13bfce402601827"
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
