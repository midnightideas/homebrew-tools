cask "effectcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.16.0/effectcraft-0.16.0-macos-universal.dmg"
        sha256 "b387729d7ffad9c504edcb66cfe46bafc5b54542f9d2a0727669ce463eb0814c"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.16.0/effectcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "d10bc0625f756fe35bc00509079f6a96a58e2fdb18dba344564f82d3e7b3a665"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.16.0/effectcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "93a6c98e4a75552c4e5f11e0c6834d3b6f8a6718c1670a8349f637e6eecea0bc"
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
