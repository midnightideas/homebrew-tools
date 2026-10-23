cask "cadcraft" do
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.12.0/cadcraft-0.12.0-macos-universal.dmg"
        sha256 "cb525bc316a6e82abf9fb904553953aef2424185701227f8478f62be50c793b8"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.12.0/cadcraft-0.12.0-linux-aarch64.AppImage"
            sha256 "8421fa90e4602e34761b01cce993a8a009d102ed4328ab73326859fff728bef7"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.12.0/cadcraft-0.12.0-linux-x86_64.AppImage"
            sha256 "e8514bb688d03cfa60df654adc5706a4425b046036e873c685e0dd2fa47e9b73"
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
