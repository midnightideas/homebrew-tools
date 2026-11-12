cask "gridcraft" do
    version "0.19.1"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.19.1/gridcraft-0.19.1-macos-universal.dmg"
        sha256 "d50165e78b8e35abbe68aa7c6f36c290023dec650d8aa797ac2347a930f6c197"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.19.1/gridcraft-0.19.1-linux-aarch64.AppImage"
            sha256 "f2ffccb29d0b7c37053fc7bd06bffbf4e2907cb2df2e4f593cf1dfd051e0bd5e"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.19.1/gridcraft-0.19.1-linux-x86_64.AppImage"
            sha256 "5b1ce10ad6c7a2d389249dfd259010014a85fce1aa42c627fc4cda571671e221"
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
