cask "soundcraft" do
    version "0.17.1"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.17.1/soundcraft-0.17.1-macos-universal.dmg"
        sha256 "f17afe3725b40b353582077b9a5de6d140452ff1dd5c315c9333d49f89bce287"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.17.1/soundcraft-0.17.1-linux-aarch64.AppImage"
            sha256 "d163b06cf869fb839471d861b967c46486a5f0cc588e12bfd565881f68802003"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.17.1/soundcraft-0.17.1-linux-x86_64.AppImage"
            sha256 "851838a2edb3bf7b2ca12e1c5460d1e6b4c36bbef2050af0377d96e4c271889c"
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
