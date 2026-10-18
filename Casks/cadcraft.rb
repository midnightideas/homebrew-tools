cask "cadcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.8.0/cadcraft-0.8.0-macos-universal.dmg"
        sha256 "518c8f38df85112ae37b62778d6b4b4d3e85dbf922cac5737d4765d508b77ee1"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.8.0/cadcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "a1982b4611b0bbb80b8e9c53602391890d638259aea3c20394a197cacb0cf654"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.8.0/cadcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "24f77e372bf07233f72672458bc69135d54bc9f6bb6379ed737870a7c1152bd2"
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
