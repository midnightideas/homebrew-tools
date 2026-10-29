cask "vectorcraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.18.0/vectorcraft-0.18.0-macos-universal.dmg"
        sha256 "6e873fb39eaeb2e8ec5ea82bad366707d6ee4f3080b6157a625c52ef74633874"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.18.0/vectorcraft-0.18.0-linux-aarch64.AppImage"
            sha256 "4312917dc0704d8967d1c3d37fc3854d5ae135631c17bb4ccb811ac1373ab2df"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.18.0/vectorcraft-0.18.0-linux-x86_64.AppImage"
            sha256 "9e0d487fc71b122e96f19b136d3acdb385eaa409f6d4a8034557f23562f2108a"
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
