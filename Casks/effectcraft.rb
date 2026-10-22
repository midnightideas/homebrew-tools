cask "effectcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.14.0/effectcraft-0.14.0-macos-universal.dmg"
        sha256 "5bb0841a65e763c4cd27dc0bcc38a29523eb2f1d51e8674d44846700a7f7f765"
        app "EffectCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.14.0/effectcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "166763333ecfa0667558b96b8da2605e6ad71d034f4dff9e86a85d424dfb6260"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.14.0/effectcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "061e00c17d3d57c23dd86c168b03eaa9e56ff3923c19e5acb3390699cf11edbc"
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
