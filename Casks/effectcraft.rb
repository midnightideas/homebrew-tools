cask "effectcraft" do
    version "0.25.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.25.1/effectcraft-0.25.1-macos-universal.dmg"
        sha256 "c54579332a66d8b0f3b9e01d8a712039516eed9f624bde9cefe6d134b3caec28"
        app "EffectCraft.app"
        zap trash: [
            "~/Library/Application Support/EffectCraft",
            "~/Library/Caches/EffectCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.25.1/effectcraft-0.25.1-linux-aarch64.AppImage"
            sha256 "7ac2fb9ef37a91c7425134f1f0b8eac0791a531934925298ded03da1c87ec6cc"
            app_image "effectcraft-0.25.1-linux-aarch64.AppImage", target: "EffectCraft.AppImage"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.25.1/effectcraft-0.25.1-linux-x86_64.AppImage"
            sha256 "7da14f5ca82027e2cb709dc91806c70ce41ff432adf27d2d0a37889d21b7a1ba"
            app_image "effectcraft-0.25.1-linux-x86_64.AppImage", target: "EffectCraft.AppImage"
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
