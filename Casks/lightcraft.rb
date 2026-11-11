cask "lightcraft" do
    version "0.20.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.20.0/lightcraft-0.20.0-macos-universal.dmg"
        sha256 "ddb34c8c87bb05ad2c295052e3026363686d7995b08bcfe50e6cd98a6b67a697"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.20.0/lightcraft-0.20.0-linux-aarch64.AppImage"
            sha256 "810e99565a6fd0bd4414cd478fee4b69da5de2f764bc4fac90f4daeeff081f9b"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.20.0/lightcraft-0.20.0-linux-x86_64.AppImage"
            sha256 "66be1e9185d56f60086e9a7c019064dd238d95531c13c0e1c83a527fceb73e10"
        end
    end

    name "LightCraft"
    desc "Lightroom-style photo library and raw development"
    homepage "https://github.com/storytold/lightcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/lightcraft",
        "~/.local/share/lightcraft",
        "~/.cache/lightcraft",
    ]
end
