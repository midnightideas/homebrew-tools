cask "gridcraft" do
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.9.0/gridcraft-0.9.0-macos-universal.dmg"
        sha256 "79026d66255cdb1d70884327595a73ca43e2f5f10d0ab4bf22407970dea8a74b"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.9.0/gridcraft-0.9.0-linux-aarch64.AppImage"
            sha256 "397db93aa9aa41ce6cbea7cff828f54b01113de0b532f72ade475e2d0bca3405"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.9.0/gridcraft-0.9.0-linux-x86_64.AppImage"
            sha256 "33020eef8c42271dd141547aa672bdf73c3e07ce0eb7914c9456ef8487e8f5fd"
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
