cask "soundcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.17.0/soundcraft-0.17.0-macos-universal.dmg"
        sha256 "24744b39f7149d570c7ab10a778d6ea178ae6065192eabe782bf29d9d6a2b8bc"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.17.0/soundcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "66bf47d3e4a255e9776646f28c94fde27c6626fc597cd22be62b232794d2cfc3"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.17.0/soundcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "033d7f600fa590fcb7f57ba079010fa6ab3baf67307fd75eff3d1fac519a3bad"
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
