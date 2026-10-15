cask "gridcraft" do
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.7.0/gridcraft-0.7.0-macos-universal.dmg"
        sha256 "96194d335e780808c6a1fae3a3ee72d977178eadcd719623645b88433ef19be8"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.7.0/gridcraft-0.7.0-linux-aarch64.AppImage"
            sha256 "97c6923e127c846c65fa08050e5840b2bd46f244dda3d2ec42ec198c14d94287"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.7.0/gridcraft-0.7.0-linux-x86_64.AppImage"
            sha256 "2daace8be3719afee727d2e353aa4bd0ac22798c312c92c2c6d5e42f27f70812"
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
