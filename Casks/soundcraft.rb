cask "soundcraft" do
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.20.1/soundcraft-0.20.1-macos-universal.dmg"
        sha256 "eb1dd392d7c3867b569aa9e08c016427096800016ff33f8f4e0192e43d9e6c0b"
        app "SoundCraft.app"
        zap trash: [
            "~/Library/Application Support/SoundCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.20.1/soundcraft-0.20.1-linux-aarch64.AppImage"
            sha256 "7dad0ab5157b69e43c0c542665fd63c5570a6c28a135ec70f1a7f0efbcdbe503"
            app_image "soundcraft-0.20.1-linux-aarch64.AppImage", target: "SoundCraft.AppImage"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.20.1/soundcraft-0.20.1-linux-x86_64.AppImage"
            sha256 "4dbb402a413ec2a53103b9fa77d6356e6feeb086d94975c95e635c74b434daf8"
            app_image "soundcraft-0.20.1-linux-x86_64.AppImage", target: "SoundCraft.AppImage"
        end
        zap trash: [
            "~/.config/soundcraft",
        ]
    end

    name "SoundCraft"
    desc "Pro Tools-style digital audio workstation"
    homepage "https://github.com/storytold/soundcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
