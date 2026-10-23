cask "gridcraft" do
    version "0.11.1"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.11.1/gridcraft-0.11.1-macos-universal.dmg"
        sha256 "d55c7e1ee56c08a4fafc06fc47a0e9259d12fafc71b2742e2dec607c44554fab"
        app "GridCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.11.1/gridcraft-0.11.1-linux-aarch64.AppImage"
            sha256 "b032e03e5c7996b01d045e3d93e31217a991bf6b312d3440a54e7b03f635b43d"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.11.1/gridcraft-0.11.1-linux-x86_64.AppImage"
            sha256 "5eb34438fddf24271d6309d1f4b86d07bb8d49261433d90b88fd24e42330c625"
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
