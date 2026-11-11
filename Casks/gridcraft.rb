cask "gridcraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.18.0/gridcraft-0.18.0-macos-universal.dmg"
        sha256 "35d96ba6fa8bbf90962fbce976b9206887d67a93827e16bbf438f8a915140dd3"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.18.0/gridcraft-0.18.0-linux-aarch64.AppImage"
            sha256 "fe77dc9383b275a9b04be2e0a818099efecea0458f372cd571533d6ce88d7d55"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.18.0/gridcraft-0.18.0-linux-x86_64.AppImage"
            sha256 "fde2f9982ac769026521cb6f710ec96b4d919b1634ad68b15b2b9bf62467020c"
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
