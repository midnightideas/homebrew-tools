cask "soundcraft" do
    version "0.13.1"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.13.1/soundcraft-0.13.1-macos-universal.dmg"
        sha256 "5cd4c45862fdc9ddc8c2a64e565d0a17e70f2f4d23aee57467a4812268143f4b"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.13.1/soundcraft-0.13.1-linux-aarch64.AppImage"
            sha256 "e5b7eeaf1fb81b60b1c4650cc4de3e0dbabc464b0561ab28dc84d45d2ffc4c58"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.13.1/soundcraft-0.13.1-linux-x86_64.AppImage"
            sha256 "607f4a13f929b5f237de61e9040be4bfc86a06644bf2a103c73f7b9c84d3bf19"
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
