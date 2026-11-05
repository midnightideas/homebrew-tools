cask "gridcraft" do
    version "0.16.1"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.16.1/gridcraft-0.16.1-macos-universal.dmg"
        sha256 "f735ea01a89feceef94eebc253457afb2c1463edf7e0a7351651c075a0fecb81"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.16.1/gridcraft-0.16.1-linux-aarch64.AppImage"
            sha256 "3b241c8ba608c035527805802052ed003503ad11501668cb7c2824ad619d37a2"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.16.1/gridcraft-0.16.1-linux-x86_64.AppImage"
            sha256 "97b6ad3fbe471d2de94deaaa7db312624a39dd63e5ee1ebbf6b38563d62aae57"
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
