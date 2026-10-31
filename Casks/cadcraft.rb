cask "cadcraft" do
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.15.1/cadcraft-0.15.1-macos-universal.dmg"
        sha256 "4393e64928f8a7de65be85b5e70980f96bc03763661fd0e35471221e7322b98e"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.15.1/cadcraft-0.15.1-linux-aarch64.AppImage"
            sha256 "b607b93d3eb923af5cb3bb6e7b08a915c5123263e8e13cd64b02f50e43e657e4"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.15.1/cadcraft-0.15.1-linux-x86_64.AppImage"
            sha256 "88ae616958413b8fa56259df6f70fb695ab90b472e4c63cf955ae6a6471bb11d"
        end
    end

    name "CADCraft"
    desc "AutoCAD-style 2D/3D CAD application"
    homepage "https://github.com/storytold/cadcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/cadcraft",
        "~/.local/share/cadcraft",
        "~/.cache/cadcraft",
    ]
end
