cask "gridcraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.10.0/gridcraft-0.10.0-macos-universal.dmg"
        sha256 "4ff99125557848e3997689122e7a82f8c110d09fd6615072c3a26341b70588cf"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.10.0/gridcraft-0.10.0-linux-aarch64.AppImage"
            sha256 "5a1584561ce3f0fe53f73cdff0b5c62f96caef644f96e646219c746eb5e51dfc"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.10.0/gridcraft-0.10.0-linux-x86_64.AppImage"
            sha256 "489f00d329361d21b4ec5f77fb042782edb72c33144f83ede43aa3db8e52139b"
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
