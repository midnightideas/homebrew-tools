cask "effectcraft" do
    version "0.21.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.21.0/effectcraft-0.21.0-macos-universal.dmg"
        sha256 "edf311ed25b75da1793c808a37336e00a353e733d657f64eddc35f0999b66966"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.21.0/effectcraft-0.21.0-linux-aarch64.AppImage"
            sha256 "dd5b7598affdbb12195057e6c2c7dc9bf12214af5ae9984db21feb7d8daa32b6"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.21.0/effectcraft-0.21.0-linux-x86_64.AppImage"
            sha256 "fb19e41e3a3dd2878b03d3504f75ab616c527fa75428491b6016d46789fd9f20"
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
