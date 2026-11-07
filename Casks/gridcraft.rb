cask "gridcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.17.0/gridcraft-0.17.0-macos-universal.dmg"
        sha256 "35ba606e448dbf5e10db9508354593468a4ef39d297644e12c179e55b72ff0a7"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.17.0/gridcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "e87751d06768702528acc4e8efdb9fca747362a6ac1728b91735c8b6aef5d54c"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.17.0/gridcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "0455c863535822d951a1a91fdee8dd029369e0f2f93f7ac99c4916ef70a87761"
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
