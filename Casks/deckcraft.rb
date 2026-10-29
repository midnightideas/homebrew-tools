cask "deckcraft" do
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.12.0/deckcraft-0.12.0-macos-universal.dmg"
        sha256 "feb7e54543c136b349479746b60779cc5bf3e5d8b3d15838156ed16005d253d5"
        app "DeckCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.12.0/deckcraft-0.12.0-linux-aarch64.AppImage"
            sha256 "7d24a225a515d969952500543fe91367a9560f488fb327c86b42f3ef690cb61c"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.12.0/deckcraft-0.12.0-linux-x86_64.AppImage"
            sha256 "296d3e6afc51667a863cb189c2c3972fee6b9c6416484cbe09b0de7f3876ea3a"
        end
    end

    name "DeckCraft"
    desc "PowerPoint-style presentation builder"
    homepage "https://github.com/storytold/deckcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/deckcraft",
        "~/.local/share/deckcraft",
        "~/.cache/deckcraft",
    ]
end
