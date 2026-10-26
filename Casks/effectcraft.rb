cask "effectcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.17.0/effectcraft-0.17.0-macos-universal.dmg"
        sha256 "241ae2e72cefc7ae70f583017a8e6b7763702a24683dbd64849e568693f94bad"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.17.0/effectcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "5e4d001f0b0c75317a1abf6d63ac87575987f9c26397112138fbd990f22e0cbf"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.17.0/effectcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "fe10515bc697edb89f491843018c9199aa50e49cf84e7a629a234817ce2c40fc"
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
