cask "effectcraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.18.0/effectcraft-0.18.0-macos-universal.dmg"
        sha256 "79a0c24a644018eb39b722eddb5a15a34280c86856171f6a6415a3541b182004"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.18.0/effectcraft-0.18.0-linux-aarch64.AppImage"
            sha256 "bee3a7f8d720869df9f9276b3df2f8e7f54e8b9e961ab296665f24a7078b6d48"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.18.0/effectcraft-0.18.0-linux-x86_64.AppImage"
            sha256 "071f8eb42be63a7862117d399f96d7ed4cc5b90ac1d06b6bab99370d0cd4ada3"
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
