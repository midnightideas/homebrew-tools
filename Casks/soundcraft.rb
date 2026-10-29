cask "soundcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.14.0/soundcraft-0.14.0-macos-universal.dmg"
        sha256 "9377e164670ecb76a4610868ac24f7804415d82cf0016c27f24cc3cc5baa41df"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.14.0/soundcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "498826a8315e46c4862f049d705ecc7c849fcb155db5cd0d5048cb2bbdc58049"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.14.0/soundcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "e1f2eee16c6da59db23c0724e97992029bdc3a19a8e64704753d398db7832387"
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
