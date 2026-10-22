cask "soundcraft" do
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.11.0/soundcraft-0.11.0-macos-universal.dmg"
        sha256 "36fc51acefb291f58e928e05077e33c7b4d01a8614278b2af8f377aebd7e61d1"
        app "SoundCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.11.0/soundcraft-0.11.0-linux-aarch64.AppImage"
            sha256 "0fa156a6c0af84d9b320cc586857a372a3f9febb23d4b183d6265d5655a0dadb"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.11.0/soundcraft-0.11.0-linux-x86_64.AppImage"
            sha256 "b68f8d17904a60841f7fe6dd164376970b41cc388d6b8041ad18226251f5bfbb"
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
