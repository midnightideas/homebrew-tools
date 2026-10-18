cask "soundcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.8.0/soundcraft-0.8.0-macos-universal.dmg"
        sha256 "4221c313d25abc1aaca51d1495a19735b5e3c240a6820c566779c6e0b4c35320"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.8.0/soundcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "473fa2fbd9ce2a47c1d1bdc42b208f4ced24e8db6a8cf534607dd7d8451b344f"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.8.0/soundcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "9c38f8d1a5c818f673a17f68a952ea8972cea4ab4720590bdb7e393504866768"
        end
    end

    name "SoundCraft"
    desc "Pro Tools-style digital audio workstation"
    homepage "https://github.com/storytold/soundcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/soundcraft",
        "~/.local/share/soundcraft",
        "~/.cache/soundcraft",
    ]
end
