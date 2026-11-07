cask "lightcraft" do
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.19.0/lightcraft-0.19.0-macos-universal.dmg"
        sha256 "c997734f8b736518520ef3a4b319ad25c40cf03a0747b9e3dab6ef1017a9699a"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.19.0/lightcraft-0.19.0-linux-aarch64.AppImage"
            sha256 "2b70a7549e9bf58c6333af1493f7072fab8c858c0912f85fc9b01369464136a2"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.19.0/lightcraft-0.19.0-linux-x86_64.AppImage"
            sha256 "2378fcbacd10a3168cb8072728110467fd463e4b09f14a0d120fbc24f036b367"
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
