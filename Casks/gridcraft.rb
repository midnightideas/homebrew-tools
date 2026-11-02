cask "gridcraft" do
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.15.0/gridcraft-0.15.0-macos-universal.dmg"
        sha256 "32fc48bd17de7f8aba9584f5cbfd49059815645318b169d5a7f55f51a543fe25"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.15.0/gridcraft-0.15.0-linux-aarch64.AppImage"
            sha256 "99fbee299f27147af0dbefebc21d6db23a6166d3ec94635c4d03d55e2c6aee53"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.15.0/gridcraft-0.15.0-linux-x86_64.AppImage"
            sha256 "dc789babeff5d57c8044d4a77a7502e8f82e293c4099f6e51939c7d50b24bfdc"
        end
    end

    name "GridCraft"
    desc "Excel-style spreadsheet application"
    homepage "https://github.com/storytold/gridcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/gridcraft",
        "~/.local/share/gridcraft",
        "~/.cache/gridcraft",
    ]
end
