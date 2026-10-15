cask "soundcraft" do
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.7.0/soundcraft-0.7.0-macos-universal.dmg"
        sha256 "a362eb5a4284262010f76a8ea7c838e88c3da71a796ac2600604db0d7660a464"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.7.0/soundcraft-0.7.0-linux-aarch64.AppImage"
            sha256 "49ea38572f8269cf5527d8fa7bc03cb8ba1e3d36c7a282bd626fc48f371b3646"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.7.0/soundcraft-0.7.0-linux-x86_64.AppImage"
            sha256 "80f2fecd132b9a9c3ac2391664b0a0214169c8cc0e27be917a3704553a914d81"
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
