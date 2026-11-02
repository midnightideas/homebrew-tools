cask "vectorcraft" do
    version "0.20.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.20.0/vectorcraft-0.20.0-macos-universal.dmg"
        sha256 "9061ff391df0d7e4a843f9fba6c2d3ff3a2cf118d3f4cdb72f240dbdbec38b18"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.20.0/vectorcraft-0.20.0-linux-aarch64.AppImage"
            sha256 "a27a0732705293f5092adbe4daea19a968c52d823f14dfe09909f5212aad9091"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.20.0/vectorcraft-0.20.0-linux-x86_64.AppImage"
            sha256 "b625bae80558f95d94b9cd0ce74224d2a83180106dab2619559551cab216ead4"
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
