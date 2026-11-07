cask "soundcraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.18.0/soundcraft-0.18.0-macos-universal.dmg"
        sha256 "c93ce20730c2e35bd2b1c3dce8d288eb502cf4640feb025734bd7cbe61915487"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.18.0/soundcraft-0.18.0-linux-aarch64.AppImage"
            sha256 "49a79246e9257cdeee4ec5473b8d57e6bb359c3076016d2541271057a1599e1e"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.18.0/soundcraft-0.18.0-linux-x86_64.AppImage"
            sha256 "c83de262c53d78adb36f439e06619e0dcac0ebdeb0ed168843fcb141e93b01ba"
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
