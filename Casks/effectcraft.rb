cask "effectcraft" do
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.19.0/effectcraft-0.19.0-macos-universal.dmg"
        sha256 "2b75bca532a06f66b04150b835853f41028821d74b6bae357f2232535c0be450"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.19.0/effectcraft-0.19.0-linux-aarch64.AppImage"
            sha256 "45aca1be69c186447f53ab85a5d22507a36efee224edc944dd09f18056ee05eb"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.19.0/effectcraft-0.19.0-linux-x86_64.AppImage"
            sha256 "9c8b8c5b33f1f04240deaebc854cc53b997cda48cf29ecd7173b43c98049f0c1"
        end
    end

    name "EffectCraft"
    desc "After Effects-style motion graphics and compositing"
    homepage "https://github.com/storytold/effectcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/effectcraft",
        "~/.local/share/effectcraft",
        "~/.cache/effectcraft",
    ]
end
