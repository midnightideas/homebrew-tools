cask "lightcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.17.0/lightcraft-0.17.0-macos-universal.dmg"
        sha256 "656a4dbe34edabe478f6ba1c838f718ea67e5ca7c61c1591c7be08dc3621a14b"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.17.0/lightcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "c3f0aca29e12fc67be3c3fe222739a2514795db925bff95ebc5f450e3950aedf"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.17.0/lightcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "e592a27a94ad20a0a0baee7893e92d9079ec412495f987a9c0854b99ec00b21b"
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
