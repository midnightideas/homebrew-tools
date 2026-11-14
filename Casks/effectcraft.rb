cask "effectcraft" do
    version "0.24.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.24.1/effectcraft-0.24.1-macos-universal.dmg"
        sha256 "22d0111d1daaa7142ee6266a2b8174d2f4d375c4c12e0dfc40a04db3dfb35851"
        app "EffectCraft.app"
        zap trash: [
            "~/Library/Application Support/EffectCraft",
            "~/Library/Caches/EffectCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.24.1/effectcraft-0.24.1-linux-aarch64.AppImage"
            sha256 "89898fa346ee5c59b3815f24db318178ca23a4b593769bdd840da81f72f4d06f"
            app_image "effectcraft-0.24.1-linux-aarch64.AppImage", target: "EffectCraft.AppImage"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.24.1/effectcraft-0.24.1-linux-x86_64.AppImage"
            sha256 "9f8a16cf74147c9e2ac3b65fa6f5be96a3e10ead92ddf08d544f5d3990ad64dc"
            app_image "effectcraft-0.24.1-linux-x86_64.AppImage", target: "EffectCraft.AppImage"
        end
        zap trash: [
            "~/.config/effectcraft",
            "~/.cache/effectcraft",
            "~/.local/share/applications/ai.storyteller.effectcraft.desktop",
            "~/.local/share/icons/hicolor/256x256/apps/ai.storyteller.effectcraft.png",
        ]
    end

    name "EffectCraft"
    desc "After Effects-style motion graphics and compositing"
    homepage "https://github.com/storytold/effectcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
