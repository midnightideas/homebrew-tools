cask "designcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.8.0/designcraft-0.8.0-macos-universal.dmg"
        sha256 "10b1035af24dbf1d760223e9d932dea8f9235a63395e0fc1b4fa61d631688cf7"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.8.0/designcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "6ffff5e6dfad31459e7f3c97be110ed21c069cb60203870de7a52746d4e70a6d"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.8.0/designcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "88d57710f56c9fb7d8e33e046061eff839117971b402a4103c4b332b5ca3b5df"
        end
    end

    name "DesignCraft"
    desc "InDesign-style page layout application"
    homepage "https://github.com/storytold/designcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/designcraft",
        "~/.local/share/designcraft",
        "~/.cache/designcraft",
    ]
end
