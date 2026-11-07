cask "designcraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.18.0/designcraft-0.18.0-macos-universal.dmg"
        sha256 "0c24487389b1c8710c44e005d352ddf9919adaaefcf78a53bc522ea225ffe225"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.18.0/designcraft-0.18.0-linux-aarch64.AppImage"
            sha256 "61a21b74d56e66292bfa22e04580c15334d399727d1f67c8635d42d9aec20bd0"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.18.0/designcraft-0.18.0-linux-x86_64.AppImage"
            sha256 "013640920f00af2a4fca09c1bcd44d97bd404f68e1bd8665377335f2c12c20d3"
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
