cask "soundcraft" do
    version "0.12.1"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.12.1/soundcraft-0.12.1-macos-universal.dmg"
        sha256 "96f2bcf47ab291fdbb963344dbf2b75e74f39cbda297a0a6658dbb14757b72d9"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.12.1/soundcraft-0.12.1-linux-aarch64.AppImage"
            sha256 "1f8dd70890da8e1ea730e81724105c1b37cf6cec21a31d5cbb5ee23dd764a090"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.12.1/soundcraft-0.12.1-linux-x86_64.AppImage"
            sha256 "a61a56691fad5c22944b44322a5b7db6d717e5bf47adf8dcbbc883f5498593eb"
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
