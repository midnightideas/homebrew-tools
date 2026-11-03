cask "designcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.17.0/designcraft-0.17.0-macos-universal.dmg"
        sha256 "d89d1bb101b477cb521fd13551f7bac2a90662ed83e5ccf45571e967834e4327"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.17.0/designcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "8d7f41d66ba0d17618e450e8b2580ede922cdfda4fa92f9d4239a57da5f561bc"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.17.0/designcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "4451904013117f7ff2060a9710b0ce397d1016451e4b984cc955dc0547eb5621"
        end
    end

    name "DesignCraft"
    desc "InDesign-style page layout application"
    homepage "https://github.com/storytold/designcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/designcraft",
        "~/.local/share/designcraft",
        "~/.cache/designcraft",
    ]
end
