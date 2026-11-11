cask "soundcraft" do
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.19.0/soundcraft-0.19.0-macos-universal.dmg"
        sha256 "94b649503b68c70b048f12e578e859bee51ca7d718db0b02f955a06b28a9696f"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.19.0/soundcraft-0.19.0-linux-aarch64.AppImage"
            sha256 "c0b5d7cbd14e618e68983d5285e2d1f7ac0c4ac37c3c2bbc62930031e0db8320"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.19.0/soundcraft-0.19.0-linux-x86_64.AppImage"
            sha256 "aaded74e4f132c033acc1223c776a74e59a751dc908841b4c31572e38939198f"
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
