cask "vectorcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.16.0/vectorcraft-0.16.0-macos-universal.dmg"
        sha256 "442befd5daea3e473bfc7f8ed697b9af29df4442e31d3de40d6d028878c43b91"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.16.0/vectorcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "bd5a8dd7094eee95ca67113cbc2fdafb94f4da0081e1afb29a0c7b5ea788e014"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.16.0/vectorcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "8a1f22458d2b00940efd1a569dece25848fad18c75a5a77d5e8c4b7192a92319"
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
