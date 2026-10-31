cask "vectorcraft" do
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.19.0/vectorcraft-0.19.0-macos-universal.dmg"
        sha256 "60e03f845d305273f88fa31890a67763817c1b291c303ef0b5290184902fc77d"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.19.0/vectorcraft-0.19.0-linux-aarch64.AppImage"
            sha256 "5b83593ac1fface961ddac6a858706882dbe96af78514f91c87a6a2ef907e327"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.19.0/vectorcraft-0.19.0-linux-x86_64.AppImage"
            sha256 "1869554bafd428db3b368fa405b8ab488b25d324d380e772bc0b118bbacb34c5"
        end
    end

    name "VectorCraft"
    desc "Illustrator-style vector editor"
    homepage "https://github.com/storytold/vectorcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/vectorcraft",
        "~/.local/share/vectorcraft",
        "~/.cache/vectorcraft",
    ]
end
