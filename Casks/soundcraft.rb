cask "soundcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.16.0/soundcraft-0.16.0-macos-universal.dmg"
        sha256 "e78a6c3daf69ae83c4765ee4f175993af8147399f4629d9df9c25dafe96c3029"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.16.0/soundcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "dae7f2ce634aa068e1f445ee16f0834e6221c427a8b3c3bd459483395193fd6c"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.16.0/soundcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "507988f768de8496764733e5e715e027986f950a845a3e8124af92a885f5b756"
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
