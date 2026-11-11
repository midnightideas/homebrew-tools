cask "effectcraft" do
    version "0.23.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.23.1/effectcraft-0.23.1-macos-universal.dmg"
        sha256 "10703ae0b8b279241e7a87b69bfa5ae0213cc21a67a04ea978e84309f6e8e2f8"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.23.1/effectcraft-0.23.1-linux-aarch64.AppImage"
            sha256 "b1198a6f9d5ecd28a9f5bcf90ce3ee95448f0ea7eaac0792eeb3bcad9a05d6dc"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.23.1/effectcraft-0.23.1-linux-x86_64.AppImage"
            sha256 "7905485d7e91999a0c19ecba447d0dfd11c13bddb132bdf9cca65cd8b60671fb"
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
