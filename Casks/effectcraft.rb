cask "effectcraft" do
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.21.1/effectcraft-0.21.1-macos-universal.dmg"
        sha256 "ac70097fe03871ef88ea44c428b2639aa3346539b0273c111e416c32b84e7720"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.21.1/effectcraft-0.21.1-linux-aarch64.AppImage"
            sha256 "3d7e326abaf1a62ea2c3d5ee6f11cbba65a761b65bc4880edfd1cecf109cff52"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.21.1/effectcraft-0.21.1-linux-x86_64.AppImage"
            sha256 "5bd55d407609ba0b2df483e3a95505422398d2b874315da506beb1f4d5958f3c"
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
