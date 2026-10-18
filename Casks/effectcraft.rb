cask "effectcraft" do
    version "0.11.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.11.1/effectcraft-0.11.1-macos-universal.dmg"
        sha256 "73471a98b510596bcca96c6c055665b36ebcf619d3937c3e246d5249ad046cf4"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.11.1/effectcraft-0.11.1-linux-aarch64.AppImage"
            sha256 "14f869f7a2bd38ab42ffedca70062264326d1de70a16f39af1ae598911a42e09"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.11.1/effectcraft-0.11.1-linux-x86_64.AppImage"
            sha256 "231e60f367334d7e85891fe653c4a434aa093c21313e1ecc8fe1459b6fd58379"
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
