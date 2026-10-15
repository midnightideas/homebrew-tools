cask "effectcraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.10.0/effectcraft-0.10.0-macos-universal.dmg"
        sha256 "d84bfac63e566815b413309cf92d3db48cc1a3d2f20b949742d45735bdb597e8"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.10.0/effectcraft-0.10.0-linux-aarch64.AppImage"
            sha256 "6bc2c14e15a6a4b69b32e852b7e6ab73ab6b8c9f47a034fd6a946b23a6af725d"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.10.0/effectcraft-0.10.0-linux-x86_64.AppImage"
            sha256 "d0e4016f6e5915bf847465fcfa4053a1607e0afa16b35fed156a78c75e88b650"
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
