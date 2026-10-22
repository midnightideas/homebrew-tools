cask "vectorcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.14.0/vectorcraft-0.14.0-macos-universal.dmg"
        sha256 "29630c9c4dbc5be351b378f0775feed617a7cc599b93859cb98e3f7d379bcd7b"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.14.0/vectorcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "5aadfa7919085a543ab5261d77c4c38d64096493ca7a49e22da32880926fad94"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.14.0/vectorcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "89757a1e806164b95eae2cef9bdf98bf1a03ef10a9b2cc8a50bd05c54b74c792"
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
