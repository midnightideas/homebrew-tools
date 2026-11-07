cask "effectcraft" do
    version "0.22.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.22.0/effectcraft-0.22.0-macos-universal.dmg"
        sha256 "bd71b859f5e385a52e77604c4da19069e5f9ee94f99bb9d89ed3b63ec8c385d4"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.22.0/effectcraft-0.22.0-linux-aarch64.AppImage"
            sha256 "7e13ccc2066eadea2212c1b39780e7cceb3ca16b48858ff6c0697960cff55496"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.22.0/effectcraft-0.22.0-linux-x86_64.AppImage"
            sha256 "c3bd7078b2101ef7639bfce24d3217059ae5e63f81c24c4216c3c4be812a6752"
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
