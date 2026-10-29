cask "gridcraft" do
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.13.0/gridcraft-0.13.0-macos-universal.dmg"
        sha256 "67b6a023b465edf85ef5a309d49a6b00a085e3ea3dc9dddc0060996b38515168"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.13.0/gridcraft-0.13.0-linux-aarch64.AppImage"
            sha256 "33f3d28a237bea204203ef0576f835facfa7e10910ce502886bf8f5b434cbb7b"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.13.0/gridcraft-0.13.0-linux-x86_64.AppImage"
            sha256 "2a87c3794cb2a7d0242a51c7695883b8beae51a7c5fac589a7d58dde1958b385"
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
