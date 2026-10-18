cask "gridcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.8.0/gridcraft-0.8.0-macos-universal.dmg"
        sha256 "260622fc0e0b18cc88162f0c2294759b58f8a32efa43ca6bf569e8b48aee2a23"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.8.0/gridcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "fb45826f529a1607fb8404a5f7bd3022e48fc778d936bd284ff42a859f9b0795"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.8.0/gridcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "942096a29a534aa2503e9e7aa1816e952f7250e73d55f8f32afd077547617f77"
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
