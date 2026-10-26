cask "gridcraft" do
    version "0.12.1"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.12.1/gridcraft-0.12.1-macos-universal.dmg"
        sha256 "ee234f51e2e747dcf278fde984c86218fdfe2ff7188c01b699394fcaef4033be"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.12.1/gridcraft-0.12.1-linux-aarch64.AppImage"
            sha256 "6f89438cc1b340197cf9dcc3506961c2dabc1e0a797213c997fa51b0156f4b46"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.12.1/gridcraft-0.12.1-linux-x86_64.AppImage"
            sha256 "eb2de0401e1089d6f76c07b884b82d71c44e7455efae2014cc347a8a0c9f1277"
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
