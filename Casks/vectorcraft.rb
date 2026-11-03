cask "vectorcraft" do
    version "0.21.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.21.0/vectorcraft-0.21.0-macos-universal.dmg"
        sha256 "cee7434dd52d7e783d3f9810ee008f3a93b873da5a5ec7801a670ea93787c7e2"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.21.0/vectorcraft-0.21.0-linux-aarch64.AppImage"
            sha256 "80c48decc4eab641766199d0a1dc87b7948c3776e4d31ad7f5c7ba9338b0da97"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.21.0/vectorcraft-0.21.0-linux-x86_64.AppImage"
            sha256 "94444a0970f495e2251435e60fe3dbead77f7b136bf334547426a920cf2e9858"
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
