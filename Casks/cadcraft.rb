cask "cadcraft" do
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.19.0/cadcraft-0.19.0-macos-universal.dmg"
        sha256 "d3a3c2dc5fe9945babfaa420716602812c3c3cec8b0fb3ab2502ef5e78b960b3"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.19.0/cadcraft-0.19.0-linux-aarch64.AppImage"
            sha256 "8c3d8c37d44e9f815989fb1f664d06eb9a55814ba316d0acd6c2bef75e3ae1d6"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.19.0/cadcraft-0.19.0-linux-x86_64.AppImage"
            sha256 "019d0a4aba1550faf91624e8d3af3adf8e27fee1997579b54f985f693395baf9"
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
