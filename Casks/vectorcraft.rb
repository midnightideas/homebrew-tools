cask "vectorcraft" do
    version "0.13.1"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.13.1/vectorcraft-0.13.1-macos-universal.dmg"
        sha256 "b932c38927a007f30218c4ed404a5c48a3f41674d6e4c560a662c7ffdbdb706f"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.13.1/vectorcraft-0.13.1-linux-aarch64.AppImage"
            sha256 "c5cfac1f67d6262c0f599b2073986e45d1e0d4b4507b72f675e3308f637b020c"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.13.1/vectorcraft-0.13.1-linux-x86_64.AppImage"
            sha256 "95457bb9b48bc6344124c2bf32a106006548aa594b1b8d1d8ca47d52a30e577e"
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
