cask "cadcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.14.0/cadcraft-0.14.0-macos-universal.dmg"
        sha256 "05aae1cc33745c0cd4171e74e05971d625b29884bb49e007031a42ae1adc02d2"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.14.0/cadcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "1c09e2f8db7bbe6b709d0a5eca607e753fcb266b54e8fa83b7e7c03f9ac94bfc"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.14.0/cadcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "d054e5769ee18134698d0773476871cadd89491a91523c3eb258a82626bb99e7"
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
