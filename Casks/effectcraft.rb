cask "effectcraft" do
    version "0.20.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.20.0/effectcraft-0.20.0-macos-universal.dmg"
        sha256 "d603a803e3edc0a8b440c5fbcd2caf9b775f85305100090d3ad2e4c04a98bac1"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.20.0/effectcraft-0.20.0-linux-aarch64.AppImage"
            sha256 "021946631486a7970db824b515a275ee95be3edb584f9aeef986e36171c29cdb"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.20.0/effectcraft-0.20.0-linux-x86_64.AppImage"
            sha256 "6ccada9ca8b54114b79f7b99c33a515a3e4b54a9baba43eb434e885e4db5a5f7"
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
