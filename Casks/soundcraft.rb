cask "soundcraft" do
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.15.0/soundcraft-0.15.0-macos-universal.dmg"
        sha256 "f6a64e077ddeaf393de92e4e71093a91f98cd8a02f2f4c20cb318c36c8176185"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.15.0/soundcraft-0.15.0-linux-aarch64.AppImage"
            sha256 "550582a292466534189f4e96f14babc2e92f3a01ef9aff63da16f16d3bf35f3b"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.15.0/soundcraft-0.15.0-linux-x86_64.AppImage"
            sha256 "107a597fd3f6d45d921047af274e550dedeefb4d7bc8c13ec3688091309f8126"
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
