cask "gridcraft" do
    version "0.14.2"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.14.2/gridcraft-0.14.2-macos-universal.dmg"
        sha256 "7802f2abf2c48e00fda4475a48f7cf19c099d0004ae9b11b11e285ddcf01c4b4"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.14.2/gridcraft-0.14.2-linux-aarch64.AppImage"
            sha256 "529e89a8f4fa26d6a4e1b82f016480f333e5924ef1ab62f734ad1dacbfa29c44"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.14.2/gridcraft-0.14.2-linux-x86_64.AppImage"
            sha256 "0740f214339b386ab45c076fe9f6f64e4986c56c21d8fbd6bbe5d0be03ee7f2b"
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
