cask "cadcraft" do
    version "0.17.1"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.17.1/cadcraft-0.17.1-macos-universal.dmg"
        sha256 "488d97983141c3f1bfabf9342c08c1d64ddd981e8c1a8316b4c0fc97221c1c1c"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.17.1/cadcraft-0.17.1-linux-aarch64.AppImage"
            sha256 "2c58afedbe4ee1a6cd28cec3286d8afb40465b5707ea8f13bc87c8651c6f0a79"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.17.1/cadcraft-0.17.1-linux-x86_64.AppImage"
            sha256 "23e5cfce321c8adbcc56db81ffa2e47ed9dfa444918dbbaaa362d678100f9e59"
        end
    end

    name "CADCraft"
    desc "AutoCAD-style 2D/3D CAD application"
    homepage "https://github.com/storytold/cadcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/cadcraft",
        "~/.local/share/cadcraft",
        "~/.cache/cadcraft",
    ]
end
