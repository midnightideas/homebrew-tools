cask "soundcraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.10.0/soundcraft-0.10.0-macos-universal.dmg"
        sha256 "53b434d762b0a4d539e35428eb4838b03fd123e33bfb93dd6ddfdfb27489e4f8"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.10.0/soundcraft-0.10.0-linux-aarch64.AppImage"
            sha256 "c3d5dd865636f09c7cd5663fe56e568ca2913bc079b34385215597c00d9ddd37"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.10.0/soundcraft-0.10.0-linux-x86_64.AppImage"
            sha256 "27f78fb8a601635aa95c24e53c6db2f0320143e947d81a58f320b0d9c560abb9"
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
